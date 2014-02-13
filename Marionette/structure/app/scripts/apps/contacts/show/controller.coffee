define [
	'app'
	'./view'
	'entities/contact'
	'components/controller_base'
	'components/loading/loading_view'
	'components/loading/loading_controller'
],
(App, View) ->
	App.module 'ContactApp.Show', (Show) ->
		class Show.Controller extends App.Controllers.Base
			initialize: (id) ->
				
				contact = App.request 'contact:entity', id
				view = new View({ model: contact })
				window.view = view
				view.on 'contact:list', ->
					App.trigger 'contact:list'

				@show view,
					# TODO: need to refactoring the region here
					region: App.modalRegion
					# loading: 
					# 	loadingType: 'fade'

	App.ContactApp.Show.Controller