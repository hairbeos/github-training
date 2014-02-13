define [
	'app'
	'backbone.relational'
	# 'backbone.relational.persistance'
	'backbone.localStorage'
	'config/backbone/validation/renderers/bootstrap'
	# 'backbone.associations'
	# './phones'
], (
	App
) ->
	App.module 'Entities', (Entities) ->
		class Entities.Phone extends Backbone.RelationalModel
			defaults: 
				id: null
				number: ''

			localStorage: new Backbone.LocalStorage "phones-storage"

		class Entities.Phones extends Backbone.Collection
			model: Entities.Phone

			localStorage: new Backbone.LocalStorage "phones-storage"

		class Entities.Contact extends Backbone.RelationalModel
			defaults: 
				id: null
				firstName: ''
				lastName: ''
				email: ''
				phones: []

			# config for backbone.associations
			# relations: [
			# 	key: 'phones'
			# 	type: Backbone.Many
			# 	relatedModel: Entities.Phone
			# 	collectionType: Entities.Phones
			# 	# isTransient: true

			# 	map: (m) ->
			# 		console.log m
			# 		# return m.id
			# 		m
			# ]

			# config for backbone.relational
			relations: [
				type: Backbone.HasMany
				key: 'phones'
				relatedModel: Entities.Phone
				collectionType: Entities.Phones
				includeInJSON: Backbone.Model.prototype.idAttribute
				autoFetch: true
				createModels: true
				reverseRelation: 
					key: 'contact'
					includeInJSON: Backbone.Model.prototype.idAttribute
			]

			localStorage: new Backbone.LocalStorage "contacts-storage"

			validation: 
				firstName:
					required: true
					minLength: 5

				lastName:
					required: true
					minLength: 5

				email:
					required: true
					pattern: 'email'

			initialize: ->
				@on 'add:phones', ->
					console.log 'add phone'

			# initializeRelations: ->
			# 	console.log 'aaaa'

		class Entities.Contacts extends Backbone.Collection
			model: Entities.Contact

			localStorage: new Backbone.LocalStorage "contacts-storage"

		# initData = [
		# 	{ "id": 1, "firstName": "F Name1", "lastName": "FName1", "email": "hairbeos@yahho.com", "phones": [1, 2] }
		# 	{ "id": 2, "firstName": "F Name2", "lastName": "FName2", "email": "hairbeos1@yahho.com", "phones": [1] }
		# 	{ "id": 3, "firstName": "F Name3", "lastName": "FName3", "email": "hairbeos2@yahho.com", "phones": [2] }
		# ]

		Entities.Contact.setup()

		App.reqres.setHandler 'contact:entities:all', ->
			console.log 'contact:entities:all'

			contacts = new Entities.Contacts()
			contacts.fetch
				# url: '/scripts/mock/contacts.json'
				reset: true

			contacts.each (c) ->
				c.fetchRelated('phones')
			
			# console.log contacts

			# # cleanup all contacts
			# contacts.each (e) ->
			# 	e.destroy()
			# return

			# if contacts.size() is 0
			# 	collection = new Entities.Contacts(initData)
			# 	collection.each (item) ->
			# 		item.save()

			# 	contacts = collection
			console.log contacts
			contacts

		App.reqres.setHandler 'phone:entity:new', ->
				new Entities.Phone

		App.reqres.setHandler 'contact:entity', (id) ->
			# contact = Entities.Contact.find id
			# if not contact then contact = new Entities.Contact {id: id}
			contact = new Entities.Contact {id: id}
			# defer = @$.Deferred()
			# contact.fetch
			# 	# url: "http://www.mocky.io/v2/52d7a2a9cf40f8be01fb6b57?callback=?"
			# 	success: (data) ->
			# 		setTimeout defer.resolve(data), 1000000
			# 	error: (data) ->
			# 		defer.resolve(undefined)
			# defer.promise();
			contact.fetch()
				# url: "http://www.mocky.io/v2/52d7b0e3cf40f85902fb6b5e?callback=?"
			contact

		App.reqres.setHandler 'contact:entity:new', ->
			contact = new Entities.Contact()

	App.Entities