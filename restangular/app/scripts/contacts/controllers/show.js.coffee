'use stick'

angular
  .module 'ContactsApp'
  .controller 'ContactsApp.ShowController', [
    '$scope',
    'ContactService',
    'contact',
    ($scope, ContactService, contact) ->

      $scope.contact = contact
  ]
