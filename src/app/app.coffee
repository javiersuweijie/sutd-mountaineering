angular.module("mountainApp", [
  "templates-app",
  "templates-common",
  "mountainApp.home",
  "mountainApp.about",
  "mountainApp.blog",
  "mountainApp.blog.post",
  "mountainApp.event",
  "mountainApp.join",
  "tumblrService",
  "ui.router",
  "ngFitText"
])
.config ($stateProvider,$urlRouterProvider)->
  $urlRouterProvider.otherwise('/home')

.controller 'AppCtrl', ($scope, $location) ->
  $scope.menuCollapse = true
  $scope.toggleMenu = ()->
    $scope.menuCollapse = !$scope.menuCollapse
  $scope.$on '$stateChangeSuccess',
  (event, toState, toParams, fromState, fromParams) ->
    if angular.isDefined toState.data.pageTitle
      $scope.pageTitle = toState.data.pageTitle
