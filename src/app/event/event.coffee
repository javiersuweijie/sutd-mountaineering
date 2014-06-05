angular.module('mountainApp.event', [
  'ui.router'
])
.config ($stateProvider)->
  $stateProvider.state 'event',
    url: '/event'
    views:
      "main":
        controller: 'EventCtrl'
        templateUrl: 'event/event.tpl.html'
    data: pageTitle: 'Event'
  return
.controller 'EventCtrl', ($scope,$http,$filter)->
  $scope.upcoming = []
  $scope.past = []
  $http.get("https://dl.dropboxusercontent.com/s/qg8l0veawjzu099/events.json")
    .success (data)->
      today = parseInt $filter('date')(Date.now(),'yyyyMMdd')
      for event in data.events
        intDate = parseInt $filter('date')(event.date,'yyyyMMdd')
        if intDate > today
          $scope.upcoming.push event
        else
          $scope.past.push event

  return
