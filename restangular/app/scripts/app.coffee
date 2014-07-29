'use strict'

angular
  .module 'ContactsApp', []

angular
  .module 'Services', []

angular
  .module('App', [
    # 'ngAnimate',
    # 'ngCookies',
    # 'ngResource',
    # 'ngRoute',
    # 'ngSanitize',
    'ui.router',
    'restangular',
    'Services',
    'ContactsApp'
  ])

  .config ['$locationProvider', ($locationProvider) ->
    $locationProvider.html5Mode true
  ]

  .config ['RestangularProvider', (RestangularProvider) ->
    RestangularProvider.setBaseUrl('http://pataha.apiary.io')
    RestangularProvider.setRestangularFields
      selfLink: 'self.link'
  ]

  .run ['$state', '$stateParams', '$rootScope', ($state, $stateParams, $rootScope) ->
    # console.log $state
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;
  ]

