View = require 'views/base/view'

module.exports = class FooterView extends View
  autoRender: true
  container: 'footer'
  template: require './templates/footer'

  initialize: ->
    super