define ['marionette'], (Marionette) ->

  class FadeTransitionRegion extends Marionette.Region
    show: (view) -> 
      @ensureEl()
      view.render()

      @close ->
        return if @currentView and @currentView isnt view 
        
        @currentView = view

        @open view, ->
          if view.onShow then view.onShow()
          
          view.trigger("show")

          if @onShow then @onShow view
          @trigger "view:show", view

    close: (cb) ->
      view = @currentView
      delete @currentView

      if not view 
        if cb then cb.call @ 
        return 

      view.$el.fadeOut =>
        if view.close then view.close()

        @trigger "view:closed", view

        if cb then cb.call @

    open: (view, callback) ->
      
      @$el.html view.$el.hide()
      
      view.$el.fadeIn ->
        callback.call @

  FadeTransitionRegion