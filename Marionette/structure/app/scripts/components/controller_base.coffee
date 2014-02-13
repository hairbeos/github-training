define [
	'app'
], (App) ->
	App.module 'Controllers', (Controllers) -> 
		class Controllers.Base extends Marionette.Controller
			constructor: (options = {}) ->
				console.log 'starting controller: ', @
				@region = options.region or App.request "region:default"

			# 	@_instance_id = _.uniqueId("controller")
			# 	App.execute "register:instance", @, @_instance_id
				super

			# close: ->
			# 	# App.execute "unregister:instance", @, @_instance_id
			# 	super
			
			onClose: ->
				console.log 'closing controller', @

			show: (view, options = {}) ->
				_.defaults options,
					loading: false
					region: @region								 
				
				@setMainView view
				@manageView view, options
			
			setMainView: (view) ->
				## the first view we show is always going to become the mainView of our
				## controller (whether its a layout or another view type).  So if this
				## *is* a layout, when we show other regions inside of that layout, we 
				## check for the existance of a mainView first, so our controller is only
				## closed down when the original mainView is closed.
				
				return if @mainView
				@mainView = view
				@listenTo view, "close", @close
			
			manageView: (view, options) ->
				
				if options.loading
					## show the loading view
					App.execute "loading:show", view, options
				else
					options.region.show view

	App.Controllers.Base
