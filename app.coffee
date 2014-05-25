angular.module "mountainApp", [
  "templates-app",
  "templates-common",
  "mountainApp.home",
  "ngBoilerplate.about",
  "ui.router"
]
.config ($stateProvider,$urlRouterProvider)->
  $urlRouterProvider.otherwise('/home')

.controller 'AppCtrl', ($scope, $location) ->
  return
  ###
  $scope.$on '$stateChangeSuccess',
  (event, toState, toParams, fromState, fromParams) ->
    if angular.isDefined toState.data.pageTitle
      $scope.pageTitle = toState.data.pageTitle
  ###
