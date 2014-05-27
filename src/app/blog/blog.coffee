angular.module('mountainApp.blog', [
  'ui.router'
])
.config ($stateProvider)->
  $stateProvider.state 'blog',
    url: '/blog'
    views:
      "main":
        controller: 'BlogCtrl'
        templateUrl: 'blog/blog.tpl.html'
    data: pageTitle: 'Blog'
  return
.controller 'BlogCtrl', ($scope)->
  $scope.posts = [
      title: "Blog 1"
      date: "2014-05-21"
    ,
      title: "Blog 2"
      date: "2014-05-22"
  ]
  return
