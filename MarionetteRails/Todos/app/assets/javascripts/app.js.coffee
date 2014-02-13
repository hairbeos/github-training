#= require_self
#= require ./router

window.App = new Backbone.Marionette.Application()

App.module 'Models'
App.module 'Collections'
App.module 'Views'
App.module 'Controllers'
App.module 'Routers'

App.addInitializer ->
	@addRegions(mainRegion: '#content')
	@router = new @Routers.Main(controller: new @Controllers.Main)

App.on 'initialize:after', ->
	Backbone.history.start(pushState: true) if Backbone.history?

$(document).ready ->
	App.start()