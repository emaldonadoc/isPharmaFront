'use strict'
HomeView = require 'views/home/home-page-view'
utils = require 'lib/utils'

module.exports = class AlertModalView extends HomeView
  autoRender: true
  container: 'body'
  id: 'rlx-modals'
  className: 'rlx-alert-modal'
  template: require './templates/alert-modal'

  initialize: ->
    super

  attach:->
    super
    @showAsModal()

  showAsModal: ->
    $('<a>').on('click',(e) =>
      e.preventDefault()
      e.stopPropagation()
      Custombox.open({
        target: "#" + @id,
        zIndex:9999
        close: =>
          utils.redirectTo controller: 'home'
      })
    ).click()