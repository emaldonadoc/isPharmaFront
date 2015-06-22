Model = require 'models/base/model'

# Base model.
module.exports = class AlertModal extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super
