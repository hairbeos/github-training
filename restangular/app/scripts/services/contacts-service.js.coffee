'use stick'

angular
  .module 'Services'
  .factory 'ContactService', [
    'Restangular', (Restangular) ->
      all: ->
        service = Restangular.all('contacts')
        service.getList()

      get: (id) ->
        Restangular.one('contacts', id).get()
  ]
