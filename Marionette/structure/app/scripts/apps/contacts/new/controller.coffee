define [
	'app'
	'./view'
	'entities/contact'
	'components/controller_base'
],
(App, View) ->
	App.module 'ContactApp.New', (New) ->
		class New.Controller extends App.Controllers.Base

			initialize: (id) ->
				
				contact = App.request 'contact:entity:new'
				view = new View.Form({ model: contact })
				view.on 'contact:list', ->
					App.trigger 'contact:list'

				@show view

	App.ContactApp.New.Controller