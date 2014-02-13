class App.Views.Content extends Backbone.View

	template: HandlebarsTemplates['content']

	render: ->
		@$el.html(@template())
		@renderTodosView()
		@

	renderTodosView: ->
		todosView = new App.Views.Todos(collection: new App.Collections.Todos())
		@$('#todos').html(todosView.render().el)