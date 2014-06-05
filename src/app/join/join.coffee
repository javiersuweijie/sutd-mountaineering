angular.module('mountainApp.join', [
  'ui.router'
])
.config ($stateProvider)->
  $stateProvider.state 'join',
    url: '/join'
    views:
      "main":
        controller: 'JoinCtrl'
        templateUrl: 'join/join.tpl.html'
    data: pageTitle: 'Join'
  return
.controller 'JoinCtrl', ($scope,$http)->
  $scope.rentals = []
  $http.get("https://dl.dropboxusercontent.com/s/d69jidorkhzhy43/rental.json")
    .success (data)->
      for keys of data.rentals
        $scope.rentals.push
          item: keys
          cost: data.rentals[keys]
    return
