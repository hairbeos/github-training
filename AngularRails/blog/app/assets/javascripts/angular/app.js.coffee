
angular.module 'ArticleApp', []
angular.module 'Services', []
angular.module 'App',
  [
    'ngRoute',
    'ngResource',
    'Services',
    'ArticleApp'
  ]
