class App.Views.NewBook extends Backbone.View
	template: HandlebarsTemplates['backbone/templates/books/new']

	initialize: ->
		@model = new App.Models.Book()
		# @listenTo @model, 'sync', @triggerBookCreate

	# triggerBookCreate: ->
	# 	App.Vent.trigger 'book:create', @model
		
	events:
		'click .btn': 'saveBook'

	render: ->
		@$el.html(@template())
		@

	saveBook: (e) ->
		e.preventDefault()
		@model.set 'title', @$('#title').val()
		@model.set 'title', @$('#title').val()

		@model.save {},
			success: (model) -> 
				App.Vent.trigger 'book:create', model
				console.log(model)
