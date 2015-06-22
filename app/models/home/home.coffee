Model = require 'models/base/model'
Utils = require 'lib/utils'
mediator = Chaplin.mediator

# Base model.
module.exports = class Home extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super

  tagRequest:(options)->
    Utils.ajaxRequest(
      mediator.data.get('services-url')+"kiosk/ReadTag.rlx?type="+ mediator.data.get('config-type'),
      options)
