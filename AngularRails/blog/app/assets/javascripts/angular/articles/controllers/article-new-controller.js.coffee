
angular.module 'ArticleApp'
  .controller 'ArticleNewController', ($scope, $routeParams, $location, ArticleService) ->

    @service = new ArticleService()
    $scope.article = @service.get({id: $routeParams.id})
    $scope.article = { title: '', content: '' }
    
    $scope.save = ->
    	@article = $scope.article
    	@service = new ArticleService()
    	@service.create(@article)

    	$location.url '/articles'
