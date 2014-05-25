angular.module("mountainApp", [
  "templates-app",
  "templates-common",
  "mountainApp.home",
  "mountainApp.about",
  "mountainApp.blog",
  "mountainApp.event",
  "mountainApp.join",
  "ui.router"
])
.config ($stateProvider,$urlRouterProvider)->
  $urlRouterProvider.otherwise('/home')

.controller 'AppCtrl', ($scope, $location) ->
  $scope.$on '$stateChangeSuccess',
  (event, toState, toParams, fromState, fromParams) ->
    if angular.isDefined toState.data.pageTitle
      $scope.pageTitle = toState.data.pageTitle
