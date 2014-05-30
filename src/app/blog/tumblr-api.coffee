angular.module('tumblrService', [])
  .service "TumblrAPI", ($http,$interval,$sce)->

    this.posts = []
    this.totalPosts = 4294967295
    this.currentOffset = 0
    this.loading = false
    this.end = false

    this.fakeLoad = ()->
      if this.loading is true
        return
      this.id++
      this.loading = true
      $interval ()=>
        this.loading = false
        this.posts.push
          id: this.id
          title: "Blog "+this.id
          date: "2014-05-22"
        return
      , 1000, 1

    this.loadPostById = (id)->
      $http.jsonp(
        'http://api.tumblr.com/v2/blog/sutd-mountaineering.tumblr.com/'+
        'posts?api_key=wT5v47y54z3yCq95DDGcwJtq03EX9AYxKCoXTtbSvivk18vfo3&
        jsonp=JSON_CALLBACK&id='+id)

    this.loadPosts = (limit)->
      if this.loading
        return
      if this.currentOffset >= this.totalPosts
        this.end = true
        return
      this.loading = true
      $http.jsonp(
        'http://api.tumblr.com/v2/blog/sutd-mountaineering.tumblr.com/'+
        'posts?api_key=wT5v47y54z3yCq95DDGcwJtq03EX9AYxKCoXTtbSvivk18vfo3&
        jsonp=JSON_CALLBACK&offset='+this.currentOffset+
        '&limit='+limit)
        .success (data) =>
          this.totalPosts = data.response.total_posts
          this.posts.push handleText(post) for post in data.response.posts
          this.currentOffset += limit
          this.loading = false
          return

    handleText = (post)->
      sanitisedPost = post
      sanitisedPost.timestamp = post.timestamp*1000
      sanitisedPost.coverPhoto = post.body.match(/http[^\"]+/)[0]
      sanitisedPost.body = $sce.trustAsHtml(post.body)
      return sanitisedPost

    handlePhoto = (post)->
      return

    this.getPostById = (id)->
      output = post for post in this.posts when post.id is id

    return
