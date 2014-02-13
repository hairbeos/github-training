class App.Views.Todos extends Backbone.View
	
	# tagName: 'ul'

	template: HandlebarsTemplates['todos/items']

	initialize: ->
		@listenTo @collection, 'reset', @render
		@collection.fetch({ reset: true })
		console.log(@collection)

	render: ->
		console.log('Todos view is rendered')
		@$el.html(@template(collection: @items))
		@collection.forEach @renderItem, @
		@

	renderItem: (model) ->
		itemView = new App.Views.Todo({ model: model })
		@$('ul').append(itemView.render().el)