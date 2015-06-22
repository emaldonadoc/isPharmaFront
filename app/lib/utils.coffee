# Application-specific utilities
# ------------------------------
utilsChaplin = Chaplin.utils

# Delegate to Chaplin’s utils module.
utils = Chaplin.utils.beget Chaplin.utils

_.extend utils,
  redirectTo:(options) ->
    utilsChaplin.redirectTo options

  ajaxRequest:(url, options) ->
    defaultOptions={
      headers:
        'Content-Type': 'application/json'
    }
    $.extend defaultOptions, options
    $.ajax(url,defaultOptions)

  cleanModalContainer: ->
    $('#rlx-modals').remove()

  formatNumWithComma: (value) ->
    value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")

# Prevent creating new properties and stuff.
Object.seal? utils

module.exports = utils
