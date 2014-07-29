
angular.module 'ArticleApp'
  .controller 'ArticleController', ($scope, $routeParams, ArticleService) ->
    @service = new ArticleService()
    $scope.article = @service.get({id: $routeParams.id})
