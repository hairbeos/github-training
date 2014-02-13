define ['marionette'], (Marionette) ->
  class PanningRegion extends Marionette.Region
    initialize: ->
      transEndEventNames =
        WebkitTransition: "webkitTransitionEnd"
        MozTransition: "transitionend"
        OTransition: "oTransitionEnd"
        msTransition: "MSTransitionEnd"
        transition: "transitionend"

      @transEndEventName = transEndEventNames[Modernizr.prefixed("transition")]
      @transformPropName = @getPrefixedCssProp("transform")
      console.log @transEndEventName, @transformPropName

    getPrefixedCssProp: (baseProp) ->
      str = Modernizr.prefixed(baseProp)
      str = str.replace(/([A-Z])/g, (str, m1) ->
        "-" + m1.toLowerCase()
      ).replace(/^ms-/, "-ms-")
      str

    transitionToView: (newView, type) ->
      view = @currentView
      if not view or view.isClosed
        @show newView
        return

      Marionette.triggerMethod.call this, "willTransition", view
      @stopListening newView, "render"
      @listenTo newView, "render", =>
        @$el.off @transEndEventName
        translation = undefined
        if type is "slide"
          translation = "translateX(100%)"
        else if type is "rotate"
          translation = "translateX(100%) translateY(100%) rotate(" + [ "20", "40", "60", "80", "90" ][_.random(0, 4)] + "deg)"
        else translation = "translateY(100%)"  if type is "drop"
        newView.$el.css @transformPropName, translation
        @$el.append newView.el
        $background = jQuery("#world-bg")
        worldContentMatrix = Matrix.initWithElem(@$el)
        worldBgMatrix = Matrix.initWithElem($background)
        newViewMatrix = Matrix.initWithElem(newView.$el)
        @$el.addClass "animated"
        $background.addClass "animated"
        @$el.css @transformPropName, newViewMatrix.clone().invert().toMatrixString()
        $background.css @transformPropName, newViewMatrix.clone().invert().toMatrixString()
        @$el.on @transEndEventName, ->
          @$el.off @transEndEventName
          @close()
          @currentView = newView
          @$el.removeClass "animated"
          $background.removeClass "animated"
          @$el.css @transformPropName, (new Matrix()).toMatrixString()
          newView.$el.css @transformPropName, (new Matrix()).toMatrixString()
          $background.css "webkit-transform", (new Matrix()).toMatrixString()
          Marionette.triggerMethod.call newView, "show"
          Marionette.triggerMethod.call @ "show", newView

      newView.render()