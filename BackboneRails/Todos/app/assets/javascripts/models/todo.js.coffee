class App.Models.Todo extends Backbone.Model
	
	defaults:
		title: ''
		completed: false

	initialize: ->
		console.log('Todo model is started')
		@on 'change', ->
			console.log('attributes has changed')
		
		@on 'change:title', ->
			console.log('title has changed')

		@on 'invalid', ->
			console.log('model contains errors: ' + @validationError)

	validate: (attrs) ->
		if !attrs.title
			'title cant be blank'

class App.Collections.Todos extends Backbone.Collection
	
	model: App.Models.Todo

	url: '/todos'