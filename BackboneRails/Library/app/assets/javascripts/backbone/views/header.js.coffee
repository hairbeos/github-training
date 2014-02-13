class App.Views.Header extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/header']
	className: 'navbar navbar-default'

	initialize: ->
		# console.log('Header view is started')

	render: ->
		# console.log(@template())
		@$el.html(@template())
		@
