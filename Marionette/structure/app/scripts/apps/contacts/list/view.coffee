define [
	'app'
	'hbs!../templates/layout'
	'hbs!../templates/contact'
	'hbs!../templates/contacts'
], (
	App,
	layoutTpl,
	itemTpl,
	listTpl
) ->
	App.module 'ContactApp.List.View', (View) ->
		class View.Layout extends Marionette.Layout
			template: 
				type: 'handlebars'
				template: layoutTpl

			className: 'container contacts-layout'

			regions:
				panelRegion: '.pagel-region'
				contactsRegion: '.contacts-region'

		class View.Contact extends Marionette.ItemView
			template: 
				type: 'handlebars'
				template: itemTpl

			tagName: 'tr'

			triggers:

				## trigger all edit click event to collection
				"click a.edit":
					preventDefault: true
					stopPropagation: true
					event: "contact:edit"

				'click':
					preventDefault: true
					event: 'contact:show'

			events: ->
				'click a.delete': ->
					@model.destroy()

			initialize: ->
				@on 'contact:edit', ->
					console.log 'contact:edit'
				
		class View.Contacts extends Marionette.CompositeView
			template: 
				type: 'handlebars'
				template: listTpl

			className: 'contacts'
				
			itemView: View.Contact
			itemViewContainer: 'tbody'

			triggers:
				"click button.new": 
					preventDefault: true
					event: 'contact:new'
					

			# itemViewEventPrefix: 'contact'

			# initialize: ->
			# 	@on 'itemview:contact:new', (e) =>
			# 		@trigger 'itemview:contact:new'

			# onShow: ->
			# 	@$el.hide()
			# 		.fadeIn 'slow'

			# onBeforeClose: ->
			# 	@$el.fadeOut 'slow'

			# All events of the ItemView
			# itemEvents:
			# 	'render': ->
			# 		console.log @

	App.ContactApp.List.View
