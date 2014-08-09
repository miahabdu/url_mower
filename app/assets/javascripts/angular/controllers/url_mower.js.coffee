urlMowerController = angular.module('urlMowerController', ['ngAnimate'])

urlMowerController.controller 'UrlMowerCtrl', [
  "$scope"
  "$http"
  "$q"
  ($scope, $http, $q) ->

    $scope.short_url = null
    $scope.created_url = null
    $scope.letterLimit = 30
    $http.get("/links.json").then (data) ->
      $scope.top_links = data.data

    $scope.createUrl = ->
      $scope.created_url = null
      $http.post("/links.json?link[original_url]=" + $scope.link_url).then (data) ->
        console.log(data.data)
        link = data.data
        $scope.created_url = link.display_slug
        addToTopLinks(link)
          
    
    addToTopLinks = (link) ->
      addToArray = true
      i = 0

      while i < $scope.top_links.length
        addToArray = false  if $scope.top_links[i].original_url is link.original_url
        i++
      if addToArray && $scope.top_links.length < 12
        $scope.top_links.push(link)
       
]