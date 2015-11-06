exports.config =
  # See http://brunch.io/#documentation for docs.
  server:
    port: 9999
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(?!app)/
      order:
        before:[
          'bower_components/jquery/dist/jquery.js'
          'bower_components/json2/json2.js'
          'bower_components/yepnope/yepnope.js'
        ]
    stylesheets:
      joinTo:
        'stylesheets/app.css' : /^(app|vendor|bower_components)/

    templates:
      joinTo: 'javascripts/app.js'
