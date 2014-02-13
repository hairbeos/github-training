class App.Views.Todo extends Backbone.View

	tagName: 'li'
	
	template: HandlebarsTemplates['todos/item']

	events:
		'click a': 'itemClick' 

	render: ->
		console.log('Todo view is rendered')
		@$el.html(@template(@model.toJSON()))
		@

	itemClick: (e) ->
		e.preventDefault()
		console.log(e)