'use strict'
View = require 'views/base/view'
utils = require 'lib/utils'
type = null

module.exports = class MainView extends View
  autoRender: true
  container: 'main'
  template: require './templates/main'

  initialize: ->
    super
    $(@container).fadeIn()
    $('.navbar-header').hide()