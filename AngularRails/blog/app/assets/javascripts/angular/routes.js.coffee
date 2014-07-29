
angular.module 'App'
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider
      .otherwise
        templateUrl: '/assets/angular/articles/views/index.html'
        controller: 'ArticleListController'

    $locationProvider.html5Mode(true)
  ]