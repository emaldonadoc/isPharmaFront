View = require 'views/base/view'

module.exports = class HeaderView extends View
  autoRender: true
  container: 'body'
  tagName: 'header'
  template: require './templates/header'