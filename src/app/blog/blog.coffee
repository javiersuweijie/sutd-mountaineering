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
  return
