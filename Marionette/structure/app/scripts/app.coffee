define [
	# 'backbone'
	'marionette'
	'routes/router'
	'config/marionette/regions/modal'
],
(Marionette, Router, ModalRegion) ->
	App = new Marionette.Application()
	
	App.navigate = (route,  options) ->
    options || (options = { trigger: true})
    
    Backbone.history.navigate(route, options)

  App.addRegions {
  	headerRegion: '#header-region'
  	contentRegion: '#content-region'
  		# selector: '#content-region'
  		# regionType: PanningRegion
  	footerRegion: '#footer-region'
  	modalRegion: 
  		selector: '#modal-region'
  		regionType: ModalRegion
  }

  App.reqres.setHandler 'region:default', ->
  	App.contentRegion

	App.addInitializer ->
		@Router = new Router()

	App.on 'initialize:after', ->
		if Backbone.history and not Backbone.history.started
				require ['apps/contacts/contacts_app'], (ContactsApp) ->
					Backbone.history.start()
					# Backbone.history.navigate 'contacts', 
					# 	trigger: true
					# 	replace: true
					App.ContactsApp.start()
 	App
