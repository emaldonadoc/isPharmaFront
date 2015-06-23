HomeController = require 'controllers/home-controller'
ContactView = require 'views/contact/contact-view'
utils = require 'lib/utils'

mediator = Chaplin.mediator

module.exports = class ContactController extends HomeController

  beforeAction: ->
    super
    utils.cleanAndSetSelectedBar('contact')

  index:->
    @view = new ContactView

