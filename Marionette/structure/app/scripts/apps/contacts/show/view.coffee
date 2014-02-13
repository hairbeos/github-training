define [
	'app'
	'hbs!./templates/contact'
	'bootstrap'
],
(App, tpl) ->
	App.module 'ContactApp.Show', (Show) ->
		class Show.View extends Marionette.ItemView
			template:
				type: 'handlebars'
				template: tpl

			className: 'modal fade'

	App.ContactApp.Show.View
