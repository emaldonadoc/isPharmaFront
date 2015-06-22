SearchController = require 'controllers/search-controller'
ConfirmSelectModalView = require 'views/confirm-select-modal/confirm-select-modal-view'
ConfirmSelectModalModel = require 'models/confirm-modal/confirm-modal'

module.exports = class ConfirmModalController extends SearchController

  index:(params) ->
    super
    @model = new ConfirmSelectModalModel(params)
    @view = new ConfirmSelectModalView  model: @model


