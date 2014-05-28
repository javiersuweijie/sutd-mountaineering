angular.module('mountainApp.blog', [
  'ui.router',
  'infinite-scroll'
])
.config ($stateProvider)->
  $stateProvider
    .state 'blog',
      url: '/blog'
      views:
        "main":
          templateUrl: 'blog/blog.tpl.html'
      data: pageTitle: 'Blog'
    .state 'blog.index',
      url: '/index'
      views:
        "content":
          templateUrl: 'blog/blog-index.tpl.html'
          controller: 'BlogCtrl'


.controller 'BlogCtrl', ($scope,$interval,TumblrAPI)->
  $scope.posts = TumblrAPI.posts
  $scope.tumblr = TumblrAPI
  $scope.loadMore = ()->
    TumblrAPI.loadPosts(3)
  return
