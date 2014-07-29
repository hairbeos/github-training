'use stick'
angular
  .module 'ContactsApp'
  .config [
    '$urlRouterProvider',
    '$stateProvider',
    ($urlRouterProvider, $stateProvider) ->

      $stateProvider
        .state 'contacts',
          url: '/contacts/'
          templateUrl: '/views/contacts/index.html'
          
          resolve:
            contacts: ['ContactService', (service) ->
              service.all()
            ]

          controller: 'ContactsApp.ListController'
      
        .state 'contact',
          url: '/contacts/{id:[0-9]*}/'
          templateUrl: '/views/contacts/show.html'
          controller: 'ContactsApp.ShowController'
          resolve: 
            contact: ['$stateParams', 'ContactService', ($stateParams, service) ->
              service.get $stateParams.id
            ]

        # .otherwise
        #   redirectTo: '/contacts'
  ]
