Model = require 'models/base/model'


module.exports = class Products extends Model
  # Mixin a synchronization state machine.
  # _(@prototype).extend Chaplin.SyncMachine
  initialize: ->
    super

  findArticlesByCategory:(findCategory)->
    categories = @get('categories')
    products = {}
    for category in categories
      if(category.category == findCategory)
        products = category.products
        break
    return products