#= require_self
#= require_tree ./backbone/templates
#= require_tree ./backbone/views
#= require_tree ./backbone/models
#= require_tree ./backbone/collections
#= require_tree ./backbone/routers

window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Vent: _.clone(Backbone.Events)
  initialize: -> 
  	console.log('App is started')
  	new App.Routers.MainRouter()
  	Backbone.history.start()