define [
	'app'
	'hbs!../templates/header'
	'hbs!../templates/headers'
	], 
	(
		App, 
		itemTpl, 
		listTpl
	)	->
			App.module 'HeaderApp.List.View', (View) ->
				class View.Header extends Marionette.ItemView
					template: {
						type: 'handlebars'
						template: itemTpl
					}

					tagName: 'li'

				class View.Headers extends Marionette.CompositeView
					template: {
						type: 'handlebars'
						template: listTpl
					}

					# className: "navbar navbar-inverse navbar-fixed-top"
					itemView: App.HeaderApp.List.View.Header
					itemViewContainer: 'ul.navbar-nav'

					initialize: ->
						# console.log listTpl

			App.HeaderApp.List.View