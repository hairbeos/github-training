'use stick'

angular
  .module 'ContactsApp'
  .controller 'ContactsApp.ListController', [
    '$scope',
    'ContactService',
    'contacts',
    ($scope, ContactService, contacts) ->

      $scope.contacts = contacts
  ]
