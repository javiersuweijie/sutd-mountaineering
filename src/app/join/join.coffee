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
.controller 'JoinCtrl', ($scope)->
  return
