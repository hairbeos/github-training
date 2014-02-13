#= require_tree ./models
#= require_tree ./views

class App.Routers.Main extends Backbone.Marionette.AppRouter

  appRoutes:
    "": "index"
    'todos': 'index'

class App.Controllers.Main extends Backbone.Marionette.Controller
	
	index: ->
		todosView = new App.Views.Todos.Todos
		App.mainRegion.show todosView

	todos: ->
		console.log('todos todos')
