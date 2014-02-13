class App.Models.Book extends Backbone.Model
	defaults:
		coverImage: ''
		title: 'No title'
		author: 'Unknown'
		releaseDate: 'Unknown'
		keywords: 'None'

	url: '/books'
