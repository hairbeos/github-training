define [
	'app'
	'./view'
	'entities/contact'
	'components/controller_base'
	'components/loading/loading_view'
	'components/loading/loading_controller'
],
(App, View) ->
	App.module 'ContactApp.Edit', (Edit) ->
		class Edit.Controller extends App.Controllers.Base

			initialize: (id) ->
				# promise = App.request 'contact:entity', id
				# $.when(promise).done (model) =>
				# 	view = new View.Form({ model: model })
				# 	view.on 'contact:list', ->
				# 		App.trigger 'contact:list'

				# 	@show view,
				# 		region: App.contentRegion
				# 		loading: true
				
				contact = App.request 'contact:entity', id
				view = new View.Form({ model: contact })
				view.on 'contact:list', ->
					App.trigger 'contact:list'

				@show view,
					# TODO: need to refactoring the region here
					region: App.contentRegion
					loading: 
						loadingType: 'fade'

	App.ContactApp.Edit.Controller