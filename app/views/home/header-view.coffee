View = require 'views/base/view'

module.exports = class HeaderView extends View
  autoRender: true
  container: 'header'
  template: require './templates/header'

  initialize: ->
    super