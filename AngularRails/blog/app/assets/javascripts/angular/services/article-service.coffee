
angular.module 'Services'
	.factory 'ArticleService', ($resource) ->
		class ArticleService
			constructor: ->
				@service = $resource '/articles'
				
			all: ->
				@service = $resource '/articles'
				@service.query()

			get: (params) ->
				@service = $resource '/articles/:id', params, { 'query': { isArray: false } }
				@service.query()

			create: (attrs) ->
	      new @service(article: attrs).$save (article) ->
	        attrs.id = article.id
	      attrs