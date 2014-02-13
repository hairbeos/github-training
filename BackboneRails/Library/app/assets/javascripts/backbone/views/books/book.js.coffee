class App.Views.Book extends Backbone.View
	tagName: 'li'
	className: 'book'

	template: HandlebarsTemplates['backbone/templates/books/item']

	render: ->
		@$el.html(@template({ item: @model.toJSON() }))
		console.log('Book is rendered')
		@
