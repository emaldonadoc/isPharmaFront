'use strict'
View = require 'views/base/view'
utils = require 'lib/utils'

module.exports = class MainView extends View
  autoRender: true
  container: 'main'
  template: require './templates/main'

  initialize: ->
    super
    $(@container).fadeIn()
    $('#isp-home-link').hide()

  attach: ->
    super
    $('.bxslider').bxSlider({auto:yes,pause:3000})


