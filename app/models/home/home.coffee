Model = require 'models/base/model'
Utils = require 'lib/utils'

# Base model.
module.exports = class Home extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super

  getJsonProducts:(options)->
    Utils.ajaxRequest("json/products.json",options)
