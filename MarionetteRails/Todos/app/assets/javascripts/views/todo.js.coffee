class App.module('Views.Todos').Todo extends Backbone.Marionette.ItemView
	tagName: 'li'
	template: HandlebarsTemplates['todos/todo']

class App.module('Views.Todos').Todos extends Backbone.Marionette.CollectionView
	tagName: 'ul'
	itemView: App.Views.Todos.Todo
	template: HandlebarsTemplates['todos/todos']
	# el: '#todos'
	
	initialize: ->
		@collection = new App.Collections.Todos
		@collection.fetch()