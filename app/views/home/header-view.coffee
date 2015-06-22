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
    currentTarget = @$(e.currentTarget)
    route= currentTarget.data('route')
    unless(currentTarget.parent().hasClass('active'))
      $('main').fadeOut(
        complete: =>
          utils.redirectTo controller:route, action:'index'
      )

