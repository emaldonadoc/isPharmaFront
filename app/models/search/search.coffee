Model = require 'models/base/model'
mediator = Chaplin.mediator
utils = require 'lib/utils'

# Base model.
module.exports = class Search extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super


  requestFindPo:(options)->
    utils.ajaxRequest(mediator.data.get('services-url') + url, options)

