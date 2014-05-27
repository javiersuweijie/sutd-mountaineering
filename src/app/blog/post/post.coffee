angular.module('mountainApp.blog.post', [
  'ui.router'
])
.config ($stateProvider)->
  $stateProvider
    .state 'blog.post',
      url: '/:id'
      views:
        "content":
          templateUrl: 'blog/post/post.tpl.html'
          controller: 'PostCtrl'
.controller 'PostCtrl', ($scope,$stateParams,TumblrAPI,$sce) ->
  $scope.id = parseInt($stateParams.id)
  $scope.post = {}
  init = ()->
    postArray = TumblrAPI.getPostById($scope.id)
    console.log postArray
    if postArray.length == 0
      console.log "Loading from ID"
      TumblrAPI.loadPostById($scope.id).success (data)->
        $scope.post = data.response.posts[0]
        $scope.post.body = $sce.trustAsHtml($scope.post.body)
    else
      $scope.post = postArray[0]
      return
  init()
  return
