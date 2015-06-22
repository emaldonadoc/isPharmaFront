View = require 'views/base/view'
utils = require 'lib/utils'

module.exports = class HeaderView extends View
  autoRender: true
  container: 'header'
  template: require './templates/header'

  initialize: ->
    super

  attach:()->
    super
    @delegate 'click', '.isp-courses-link', @redirectTabLink


  redirectTabLink:(e)->
    e.preventDefault()
    route= @$(e.currentTarget).data('route')
    console.log "ROUTE TO REDIRECT--->", route
    $('main').fadeOut(
      complete: =>
        utils.redirectTo controller:route, action:'index'
    )

