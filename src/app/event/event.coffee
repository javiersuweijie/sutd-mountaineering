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
.controller 'EventCtrl', ($scope)->
  return
