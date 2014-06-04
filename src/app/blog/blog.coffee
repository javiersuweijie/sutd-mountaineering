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
  $scope.tag = ""

  $scope.changeTag = (tag)->
    TumblrAPI.clear()
    $scope.posts = TumblrAPI.posts
    $scope.tag = tag
    $scope.loadMore()

  $scope.loadMore = ()->
    TumblrAPI.loadPosts(4,$scope.tag)
  return
