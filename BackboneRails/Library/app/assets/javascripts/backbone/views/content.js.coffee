class App.Views.Content extends Backbone.View
	template: HandlebarsTemplates['backbone/templates/content']
	# id: 'content-body'

	initialize: ->
		# @libraryView = new App.Views.Library()
		# @actionsView = new App.Views.ContentActions()
		# @listenTo App.Vent, 'book:create', @renderEmptyBody

	render: ->
		@$el.html(@template())
		# @renderLibrary()
		@

	# renderLibrary: ->
	# 	@$('#content-body').html(@libraryView.el)
	# 	@$('#content-actions').html(@actionsView.render().el)

	# renderEmptyBody: ->
	# 	Backbone.history.navigate('/books')

	setBodyView: (v) ->
		@changeBodyView(v)
		@$('#content-body').html(@currentBodyView.render().el)

	changeBodyView: (v) ->
		@currentBodyView.remove if @currentBodyView
		@currentBodyView = v

	setActionsView: (v) ->
		@changeActionsView(v)
		@$('#content-actions').html(@currentActionsView.render().el)

	changeActionsView: (v) ->
		@currentActionsView.remove if @currentActionsView
		@currentActionsView = v
