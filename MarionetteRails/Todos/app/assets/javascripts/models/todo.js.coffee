class App.Models.Todo extends Backbone.Model

  defaults:
    title: ''
    completed: false

  # urlRoot: '/todos'

  initialize: ->
  	console.log('model is initializated')

class App.Collections.Todos extends Backbone.Collection
  model: App.Models.Todo
  url: '/todos'

  initialize: ->
  	console.log('collection is initializated')