#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Shelfari =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

 window.Shelfari.vent = _.extend({}, Backbone.Events)