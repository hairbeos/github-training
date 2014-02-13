define [
	'app'
	'hbs!../templates/form'
	'backbone.stickit'
],
(App, formTpl) ->
	App.module 'ContactApp.New.View', (View) ->
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
				console.log @model.get('phones')
				phone = App.request 'phone:entity:new'
				phone.set 'number', "number-"
				phone.save()

				@model.get('phones').add(phone)
				@trigger 'contact:list' if @model.save()
				phone.save()

			render: ->
				super
				@stickit()
				@

			initialize: ->
				Backbone.Validation.bind @
