
contactsApp
	.controller 'ArticleListController', ($scope, $location, ArticleService) ->
    
    @service = new ArticleService()
    $scope.articles = @service.all()

    $scope.showArticle = (id) ->
      $location.url '/articles/' + id
        # .replace()

    $scope.newArticle = ->
    	$location.url '/articles/new'
