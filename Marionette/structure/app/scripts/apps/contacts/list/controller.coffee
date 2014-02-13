define [
	'app',
	'./view'
	'entities/contact'
	'components/controller_base'
	'components/loading/loading_view'
	'components/loading/loading_controller'
], (
	App,
	View
) ->
	App.module 'ContactApp.List', (List) ->
		class List.Controller extends App.Controllers.Base
			
			initialize: ->
				@layout = new View.Layout()

				@listenTo @layout, 'show', =>
					@showContactsView()

				@show @layout

			showContactsView: ->
				contacts = App.request 'contact:entities:all'
				
				view = new View.Contacts { collection: contacts }
				view.on 'itemview:contact:edit', (itemView) ->
					App.trigger 'contact:edit', itemView.model.get 'id'

				view.on 'itemview:contact:show', (itemView) ->
					App.trigger 'contact:show', itemView.model.get 'id'

				view.on 'contact:new', -> 
					App.trigger 'contact:new'

				@show view,
					loading: 
						loadingType: 'fade'
					region: @layout.contactsRegion

	App.ContactApp.List.Controller