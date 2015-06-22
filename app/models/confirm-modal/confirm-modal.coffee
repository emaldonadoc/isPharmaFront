Model = require 'models/base/model'
utils = require 'lib/utils'
mediator = Chaplin.mediator

# Base model.
module.exports = class ConfirmModal extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super

  confirm:(options)->
    utils.ajaxRequest mediator.data.get('services-url') + "confirm", options

