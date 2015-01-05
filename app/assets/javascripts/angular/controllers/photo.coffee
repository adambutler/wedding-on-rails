app = angular.module('foh')

app.controller "PhotoController", ["$scope", "$timeout", "Restangular", ($scope, $timeout, Restangular) ->

  $scope.page = 1
  $scope.rendered = false
  $scope.blockScroll = false
  $scope.photos = []
  $scope.allPhotosLoaded = false

  $scope.loadPhotos = ->
    return if $scope.allPhotosLoaded
    Restangular.one('events', 1).getList("photos", { page: $scope.page }).then (photos) ->
      if photos.length == 0
        $scope.allPhotosLoaded = true
      else
        $scope.photos = $scope.photos.concat(photos)
        $scope.blockScroll = false
        $timeout ->
          if $scope.rendered
            $(".js-justified").justifiedGallery("norewind")
          else
            $scope.rendered = true
            $(".js-justified").justifiedGallery
              rowHeight: 200
              margins: 10
        , 1
        $scope.page++

  $(window).scroll(_.throttle ->
    if navigator.userAgent.indexOf("MSIE") isnt -1
      docHeight = getDocHeight()
      winHeight = document.body.clientHeight
      scrTop = document.body.scrollTop
    else
      docHeight = $(document).height()
      winHeight = window.innerHeight
      scrTop = $("body").scrollTop()

    if scrTop >= (docHeight - (winHeight)) and $scope.blockScroll is false
      $scope.blockScroll = true
      $scope.loadPhotos()
  , 100)

  $scope.loadPhotos()
]
