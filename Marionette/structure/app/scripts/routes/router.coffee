define [
	'marionette'
], (
	Marionette
) ->
	class Controller extends Marionette.Controller
		index: ->
			console.log('app:route:index')

	class Router extends Marionette.AppRouter
		appRoutes:
			'': 'index'
		
		controller: new Controller()