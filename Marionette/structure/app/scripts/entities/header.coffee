define ['app'], (App) ->
	App.module 'Entities', (Entities) ->
		class Entities.Header extends Backbone.Model

		class Entities.Headers extends Backbone.Collection
			model: Entities.Header

			initialize: ->
				@add [
					{ name: 'Home', link: '/' }
					{ name: 'Contacts', link: '#contacts' }
					{ name: 'About', link: '#about' }
				]

		App.reqres.setHandler 'header:entities:all', ->
			new Entities.Headers()

	return App.Entities