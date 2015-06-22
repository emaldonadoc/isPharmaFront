exports.config =
  # See http://brunch.io/#documentation for docs.
  server:
    port: 8888
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(?!app)/
        'test/javascripts/test.js': /^test[\\/](?!vendor)/
        'test/javascripts/test-vendor.js': /^test[\\/]vendor/
      order:
        before:[
          'bower_components/jquery/dist/jquery.js'
          'bower_components/json2/json2.js'
          'bower_components/yepnope/yepnope.js'
        ],
        after: [
          'vendor/scripts/post-load-vendor.coffee'
        ]

    stylesheets:
      joinTo:
        'stylesheets/app.css' : /^(app|vendor|bower_components)/
        'test/stylesheets/test.css': /^test/

    templates:
      joinTo: 'javascripts/app.js'
