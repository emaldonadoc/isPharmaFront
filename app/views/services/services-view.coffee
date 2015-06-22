View = require 'views/base/view'

module.exports = class ServicesView extends View
  autoRender: true
  container: 'main'
  template: require './templates/services'

  initialize: ->
    super