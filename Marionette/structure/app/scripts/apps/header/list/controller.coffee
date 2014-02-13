define ['app', './view'], (App, View) ->
	App.module 'HeaderApp.List', (List) ->
		class List.Controller extends Marionette.Controller
			list: ->
				require ['entities/header'], ->
					entities = App.request 'header:entities:all'

					view = new View.Headers { collection: entities }
					# console.log view
					App.headerRegion.show(view)

	new App.HeaderApp.List.Controller()