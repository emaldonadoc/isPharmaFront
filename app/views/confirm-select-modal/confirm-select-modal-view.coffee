'use strict'
SearchView = require 'views/search/search-view'
utils = require 'lib/utils'

module.exports = class ConfirmSelectModalView extends SearchView
  autoRender: true
  container: 'body'
  id: 'rlx-modals'
  className: 'rlx-modal'
  template: require './templates/confirm-select-modal'

  initialize: ->
    super

  attach:->
    super
    @delegate 'click', '#rlx-confirm-modal-btn-confirm', @confirmAction
    @showAsModal()

  showAsModal: ->
    $('<a>').on('click',(e) =>
      e.preventDefault()
      e.stopPropagation()
      Custombox.open({
        target: "#" + @id,
        zIndex:9999,
        overlayClose: false
        close: =>
          utils.redirectTo controller: 'search'
      })
    ).click()

  confirmAction:(e)->
    e.preventDefault()
    current = @$(e.currentTarget)
    current.prop('disabled', 'true')
    @model.confirm(context:@)
      .done(@confirmActionSuccess)
      .fail(@confirmActionError)
      .always(=> current.prop('disabled', ''))

  confirmActionSuccess:()->
    @$('#rlx-modal-header-span').text("SUCCESS!!")
    @$('.rlx-modal-body, .rlx-modal-footer ').slideUp()
    @$('#rlx-confirm-success').slideDown()
    @timerToClose()


  timerToClose: ->
    setTimeout(
      ->
        Custombox.close()
      ,3000)

  confirmActionError: ->