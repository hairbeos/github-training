class App.Routers.MainRouter extends Backbone.Router
	routes:
		"": "index"
		"books/new": "newBook"
		'books': 'index'

	initialize: ->
		console.log('Router is started')
		@headerView = new App.Views.Header()
		@contentView = new App.Views.Content()
		@listenTo App.Vent, 'book:new', @newBook
		@listenTo App.Vent, 'book:create', @index


	index: ->
		@layoutView()
		@contentView.setBodyView(new App.Views.Library())
		@contentView.setActionsView(new App.Views.BookActions())

	layoutView: ->
		$('header').html(@headerView.render().el)
		$('#content').html(@contentView.render().el)
		# console.log(@contentView.render().el)

	newBook: -> 
		@layoutView()
		@contentView.setBodyView(new App.Views.NewBook())
		@contentView.setActionsView(new App.Views.BookActions())
