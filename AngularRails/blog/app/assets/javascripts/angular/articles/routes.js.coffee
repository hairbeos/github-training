
angular.module 'ArticleApp'
  .config ($routeProvider, $locationProvider) ->
    $routeProvider

    	.when '/articles',
        templateUrl: '/assets/angular/articles/views/index.html'
        controller: 'ArticleListController'

    	.when '/articles/new',
        templateUrl: '/assets/angular/articles/views/new.html'
        controller: 'ArticleNewController'

      .when '/articles/:id',
        templateUrl: '/assets/angular/articles/views/show.html'
        controller: 'ArticleController'
    
    $locationProvider.html5Mode(true)
     

      