#/*global require*/
'use strict'

require.config
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
   
    marionette:
      deps: [
        'jquery'
        'underscore'
        'backbone'
      ]
      exports: 'Marionette'
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'

    hbs:
      deps: [
        'handlebars'
      ]

    spin: [
      deps: ['jquery', 'spin']
      exports: 'Spinner'
    ]

    # 'backbone-associations': ["backbone"]

  paths:
    jquery: '../bower_components/jquery/jquery'
    'spin': '../bower_components/jquery.spinjs/libs/spin/spin'
    'jquery.spin': '../bower_components/jquery.spinjs/dist/jquery.spin'
    backbone: '../bower_components/backbone/backbone'
    'backbone.localStorage': '../bower_components/backbone.localstorage/backbone.localStorage'
    'backbone.stickit': '../bower_components/backbone.stickit/backbone.stickit'
    'backbone.validation': '../bower_components/backbone-validation/dist/backbone-validation-amd'
    # 'backbone.marionette': '../bower_components/backbone.marionette/lib/backbone.marionette'
    marionette: '../bower_components/backbone.marionette/lib/backbone.marionette'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    handlebars: '../bower_components/backbone.marionette.handlebars/backbone.marionette.handlebars'
    hbs: '../bower_components/require-handlebars-plugin/hbs'
    # 'backbone.associations': '../bower_components/backbone-associations/backbone-associations'
    'backbone.relational': '../bower_components/backbone-relational/backbone-relational'
    # 'backbone.relational.persistance': '../bower_components/backbone.relational-persistence/backbone.relational-persistence'

require [
  'app'
  'apps/header/header_app'
], (App) ->
  App.start()
