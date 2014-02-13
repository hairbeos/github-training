class App.Views.Library extends Backbone.View
	template: HandlebarsTemplates['backbone/templates/books/items']
	className: 'books-container'

	initialize: ->
		@items = new App.Collections.Library()
		@items.fetch({ reset: true })

		@subcribeEvents()

	render: ->
		@$el.html(@template({ books_count: @items.length }))
		@items.each @renderItem, @
		console.log('Library view rendered')
		@

	renderItem: (item) ->
		itemView = new App.Views.Book({ model: item })
		@$('.books > ul').append(itemView.render().el)

	subcribeEvents: ->
		@listenTo @items, 'reset', @render
		@listenTo @items, 'add', @renderItem

		# @listenTo App.Vent, 'book:create', @addBook

	# addBook: (book) ->
	# 	console.log(book)
