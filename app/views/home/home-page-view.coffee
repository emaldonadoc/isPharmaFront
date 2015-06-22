'use strict'
View = require 'views/base/view'
utils = require 'lib/utils'
type = null

module.exports = class HomePageView extends View
  autoRender: true
  container: 'body'
  tagName: 'main'
  className: 'home-page'
  template: require './templates/home'

  initialize: ->
    super