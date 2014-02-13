class App.Views.Header extends Backbone.View

	template: HandlebarsTemplates['header']

	render: ->
		@$el.html(@template())
		@