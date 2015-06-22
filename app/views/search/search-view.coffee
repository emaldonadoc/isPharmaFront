'use strict'
View = require 'views/base/view'
utils = require 'lib/utils'

module.exports = class HomePageView extends View
  autoRender: true
  container: 'body'
  className: 'search-view'
  template: require './templates/search'

  initialize: ->
    super

  attach:->
    super
    @delegate 'click', '.row-hover', @selectItem
    @$('#rlx-search-form').validate
      errorLabelContainer: '.errorTxt'
      errorPlacement:(error, element)->
        error.insertAfter(element)
      rules:
        type:
          required: yes,
          minlength: 4
      messages:
        type:
          required: "Field is required"

  selectItem:(e)->
    e.preventDefault()
    e.stopPropagation
    type = @model.get('type')
    utils.redirectTo controller: 'confirm-modal', action: 'index', params: @getTargetParams($(e.currentTarget), type)

  getTargetParams:(target, type)->
    {type: type,
    dispatchNumber: target.data('dispatch'),
    truckCarrier: target.data('carrier'),
    vehicle: target.data('vehicle'),
    customer : target.data('customer'),
    order: target.data('order'),
    productName: target.data('product'),
    amountToLoad : target.data('amount'),
    id: target.data('id')}
