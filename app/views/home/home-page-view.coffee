'use strict'
View = require 'views/base/view'
utils = require 'lib/utils'
type = null

module.exports = class HomePageView extends View
  autoRender: true
  container: 'body'
  className: 'home-page'
  template: require './templates/home'

  initialize: ->
    super
    @delegate 'click','.rlx-select-btn', @select


  select:(e) ->
    e.preventDefault()
    current = @$(e.currentTarget)
    current.prop('disabled', true)
    @model.tagRequest(context:@)
      .done(@tagRequestSuccess)
      .fail(@tagRequestError)
      .always(=> current.prop('disabled',''))

  tagRequestSuccess:(data)->
    data = JSON.parse(data)
    if(data.drivers.length > 1)
      utils.redirectTo action:'selectDriver', params: data
    else
      utils.redirectTo controller: 'search', params: data

  tagRequestError:(xhr)->
    console.log("Status code ", xhr.status)
    params = {
     title: "Ups!"
     message: "An error occurred when try to read tag,<br/>please try again."
     btnAcceptValue: "Ok"
    }
    utils.redirectTo action: 'alert', params: params