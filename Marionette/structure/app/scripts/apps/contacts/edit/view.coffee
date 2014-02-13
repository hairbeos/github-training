define [
	'app'
	'hbs!../templates/form'
	'backbone.stickit'
],
(App, formTpl) ->
	App.module 'ContactApp.Edit.View', (View) ->
		class View.Form extends Marionette.ItemView
			template:
				type: 'handlebars'
				template: formTpl
			className: 'container'

			ui:
				cancel: '.btn-default.cancel'

			bindings:
				"input[name=firstName]": "firstName"
				"input[name=lastName]": "lastName"
				"input[name=email]": "email"

			events:
				'submit': 'save'

			triggers:
				"click @ui.cancel":
					event: 'contact:list'
					preventDefault: true

			save: (e) -> 
				e.preventDefault()
				
				@trigger 'contact:list' if @model.save()

			render: ->
				super
				@stickit()
				# Backbone.Validation.bind @
				@

			initialize: ->
				Backbone.Validation.bind @
				
			# onShow: ->
			# 	@$el.hide()
			# 		.fadeIn 'slow'
			# 	console.log 'starting view: Edit View'

			# onBeforeClose: ->
			# 	@$el.show()
			# 		.fadeOut 'slow'
