#= require_self
#= require_tree ../templates
#= require_tree ./views
#= require_tree ./models
#= require_tree ./routers

window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
  	new App.Routers.MainRouter()
  	Backbone.history.start()
