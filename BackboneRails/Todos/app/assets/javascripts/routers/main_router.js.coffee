class App.Routers.MainRouter extends Backbone.Router
	routes:
		"": "index"
		"projects": "projects"

	initialize: ->
		console.log('Router is started')
		@headerView = new App.Views.Header()
		@contentView = new App.Views.Content()

	index: ->
		@layoutView()

	projects: ->
		@layoutView()

	layoutView: ->
		$('#header').html(@headerView.render().el)
		$('#content').html(@contentView.render().el)
