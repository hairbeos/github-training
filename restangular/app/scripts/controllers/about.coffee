'use strict'

###*
 # @ngdoc function
 # @name app.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the app
###
angular.module('App')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
