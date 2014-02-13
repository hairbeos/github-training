define [
	'app'
	'backbone.localStorage'
	'backbone.relational'
	# './contact'
], (
	App
) ->
	# App.module 'Entities', (Entities) ->
	# 	class Entities.Phone extends Backbone.RelationalModel
	# 		defaults: 
	# 			id: null
	# 			number: ''

	# 		localStorage: new Backbone.LocalStorage "phones-storage"

	# 	App.reqres.setHandler 'phone:entity:new', ->
	# 		new Entities.Phone
	
	# App.Entities.Phone