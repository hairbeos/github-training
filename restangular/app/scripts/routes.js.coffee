'use stick'

angular
  .module 'App'
  .config [
    '$urlRouterProvider',
    '$stateProvider',
    ($urlRouterProvider, $stateProvider) ->
      # Trailling slashes
      $urlRouterProvider.rule ($injector, $location) ->
        path = $location.path()
        
        # Note: misnomer. This returns a query object, not a search string
        search = $location.search()
        params = undefined
        
        # check to see if the path already ends in '/'
        return  if path[path.length - 1] is "/"
        
        # If there was no search string / query params, return with a `/`
        return path + "/"  if Object.keys(search).length is 0
        
        # Otherwise build the search string and return a `/?` prefix
        params = []
        angular.forEach search, (v, k) ->
          params.push k + "=" + v
          return

        path + "/?" + params.join("&")

      $stateProvider
        .state 'home',
          url: '/'
          templateUrl: 'views/main.html'
          controller: 'MainCtrl'
        .state 'about',
          url: '/about/'
          templateUrl: 'views/about.html'
          controller: 'AboutCtrl'
  ]
  