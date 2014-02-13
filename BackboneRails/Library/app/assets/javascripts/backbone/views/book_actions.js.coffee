class App.Views.BookActions extends Backbone.View
	template: HandlebarsTemplates['backbone/templates/book_actions']

	events:
		'click .new-book': 'actionClick'
	
	render: ->
		@$el.html(@template())
		@

	actionClick: (e) ->
		e.preventDefault()
		e.stopPropagation()

		App.Vent.trigger 'book:new'