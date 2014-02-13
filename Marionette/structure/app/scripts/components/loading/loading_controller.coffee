define [
	'app'
	'components/utilities'
	'components/controller_base'
], (App) ->
	App.module 'Components.Loading', (Loading) ->
		class Loading.LoadingController extends App.Controllers.Base
			
			initialize: (options) ->
				{ view, config } = options

				config = if _.isBoolean(config) then {} else config

				_.defaults config,
					loadingType: 'spinner'
					entities: @getEntities(view)
					debug: false

				console.log 'view: ', view, '\noptions: ', config if config.debug

				switch config.loadingType
					when "opacity"
						view.$el.css "opacity", 0.75
					when "fade"
						view.$el.hide()
							.fadeIn 'slow'
					when "spinner"						
							loadingView = @getLoadingView()
							@show loadingView
					else 
						throw new Error("Invalid loadingType")

				# loadingView = @getLoadingView()
				# @show loadingView

				@showRealView view, loadingView, config

			showRealView: (view, loadingView, config) ->
				App.execute 'when:fetched', config.entities, =>
					console.log 'entities:fetched', config.entities
					
					switch config.loadingType
						
						when "opacity"
							view.$el.removeAttr "style"
							
						when "fade"
							view.$el.hide()
								.fadeIn 'slow'
						
						when "spinner"						
							return view.close if @region.currentView isnt loadingView
					
					# TODO: need to double check the LoadingController
					
					@show view unless config.debug

			getEntities: (view) ->
				_.chain(view).pick('model', 'collection').toArray().value()[0]

			getLoadingView: ->
				new Loading.LoadingView()

		App.commands.setHandler 'loading:show', (view, options) ->
			new Loading.LoadingController
				view: view
				region: options.region
				config: options.loading