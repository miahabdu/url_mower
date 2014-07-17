urlMowerController = angular.module('urlMowerController', [])

urlMowerController.controller 'UrlMowerCtrl', [
  "$scope"
  "$http"
  "$q"
  ($scope, $http, $q) ->
    $scope.product = { name: 'Dodecahedron', price: 2.95, description: 'blah blah blah' }
       
]