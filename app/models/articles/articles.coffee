Model = require 'models/base/model'

module.exports = class Articles extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super