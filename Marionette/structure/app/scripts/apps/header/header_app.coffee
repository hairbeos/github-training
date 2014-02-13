define ['app', './list/controller'], (App, ListController) ->
	App.module 'HeaderApp', (HeaderApp) ->

		App.commands.setHandler 'header:item:active', (item) ->
			console.log('header:item:active')

		HeaderApp.on 'start', ->
			# new HeaderApp.Controller.list()
			# console.log(new Controller())
			ListController.list()

	App.HeaderApp