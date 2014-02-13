define ['app'], (App) ->
	App.module 'ContactsApp', (ContactsApp) ->
		ContactsApp.startWithParent = false

		ContactsApp.onStart = ->
			console.log('contacts:app:started')

		ContactsApp

	App.module 'ContactsApp', (ContactsApp) ->
		class ContactsApp.Controller extends Marionette.Controller
			list: ->
				require ['./apps/contacts/list/controller'], (ListController) ->
					controller = new ListController
					# controller.list()

			show: (id) ->
				require ['./apps/contacts/show/controller'], (Controller) ->
					controller = new Controller id

			new: ->
				# App.contentRegion.close()
				require ['./apps/contacts/new/controller'], (Controller) ->
					controller = new Controller

			edit: (id) ->
				# App.contentRegion.close()
				require ['./apps/contacts/edit/controller'], (Controller) ->
					controller = new Controller id

		class ContactsApp.Router extends Marionette.AppRouter
			appRoutes:
				'contacts': 'list'
				'contacts/new': 'new'
				'contacts/:id': 'show'
				'contacts/:id/edit': 'edit'

		App.on 'contact:new', ->
			App.navigate "contacts/new"

		App.on 'contact:edit', (id) ->
			App.navigate "contacts/#{id}/edit"

		App.on 'contact:show', (id) ->
			require ['./apps/contacts/show/controller'], (Controller) ->
				controller = new Controller id

		App.on 'contact:list', ->
			App.navigate "contacts"

		App.addInitializer ->
			new ContactsApp.Router { controller: new ContactsApp.Controller() }

		return

	App.ContactsApp