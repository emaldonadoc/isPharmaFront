Model = require 'models/base/model'

# Base model.
module.exports = class SelectDriverModal extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super

  filterByDriverName:(driverName)->
    filtered={
      items: [],
      tag: @get('tag')
    }
    for item in @get('items')
      filtered.items.push(item) if item.truckDriver is driverName
    filtered