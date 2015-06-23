View = require 'views/base/view'

module.exports = class ContactView extends View
  autoRender: true
  container: 'main'
  template: require './templates/contact'

  initialize: ->
    super
    $('#isp-home-link').show()

  attach:->
    super
    $('main').fadeIn()
    @$('input,textarea').jqBootstrapValidation
      preventSubmit: true
      submitError: ($form, event, errors) ->
        # something to have when submit produces an error ?
        # Not decided if I need it yet
        return
      submitSuccess: ($form, event) ->
        event.preventDefault()
        # prevent default submit behaviour
        # get values from FORM
        name = $('input#name').val()
        phone = $('input#phone').val()
        email = $('input#email').val()
        message = $('textarea#message').val()
        firstName = name
        # For Success/Failure Message
        # Check for white space in name for Success/Fail message
        if firstName.indexOf(' ') >= 0
          firstName = name.split(' ').slice(0, -1).join(' ')
        $.ajax
          url: './bin/contact_me.php'
          type: 'POST'
          data:
            name: name
            phone: phone
            email: email
            message: message
          cache: false
          success: ->
            # Success message
            $('#success').html '<div class=\'alert alert-success\'>'
            $('#success > .alert-success').html('<button type=\'button\' class=\'close\' data-dismiss=\'alert\' aria-hidden=\'true\'>&times;').append '</button>'
            $('#success > .alert-success').append '<strong>Your message has been sent. </strong>'
            $('#success > .alert-success').append '</div>'
            #clear all fields
            $('#contactForm').trigger 'reset'
            return
          error: ->
            # Fail message
            $('#success').html '<div class=\'alert alert-danger\'>'
            $('#success > .alert-danger').html('<button type=\'button\' class=\'close\' data-dismiss=\'alert\' aria-hidden=\'true\'>&times;').append '</button>'
            $('#success > .alert-danger').append '<strong>Sorry ' + firstName + ' it seems that my mail server is not responding...</strong> Could you please email me directly to <a href=\'mailto:me@example.com?Subject=Message_Me from myprogrammingblog.com;>me@example.com</a> ? Sorry for the inconvenience!'
            $('#success > .alert-danger').append '</div>'
            #clear all fields
            $('#contactForm').trigger 'reset'
            return
        return
      filter: ->
        $(this).is ':visible'
