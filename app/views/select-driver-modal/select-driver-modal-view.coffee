'use strict'
HomeView = require 'views/home/home-page-view'
utils = require 'lib/utils'

module.exports = class SelectDriverModalView extends HomeView
  autoRender: true
  container: 'body'
  id: 'rlx-modals'
  className: 'rlx-select-driver-modal'
  template: require './templates/select-driver-modal'

  initialize: ->
    super

  attach:->
    super
    @delegate 'click', '.close-cancel', @closeModal
    @delegate 'click', '.row-hover', @selectDriverName
    @showAsModal()

  showAsModal: ->
    $('<a>').on('click',(e) =>
      e.preventDefault()
      e.stopPropagation()
      Custombox.open({
        target: "#" + @id,
        zIndex:9999,
        effect: 'push',
        width: window.innerWidth * .70,
        overlayClose: false
        close: utils.cleanModalContainer
      })
    ).click()

  closeModal:()=>
    Custombox.close()
    utils.redirectTo action: 'index'

  selectDriverName:(e)=>
    nameSelected =@$(e.currentTarget).find('label').text()
    dataFiltered =@model.filterByDriverName(nameSelected)
    Custombox.close()
    utils.redirectTo controller: 'search', action: 'index', params: dataFiltered