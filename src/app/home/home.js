/**
 * Each section of the site has its own module. It probably also has
 * submodules, though this boilerplate is too simple to demonstrate it. Within
 * `src/app/home`, however, could exist several additional folders representing
 * additional modules that would then be listed as dependencies of this one.
 * For example, a `note` section could have the submodules `note.create`,
 * `note.delete`, `note.edit`, etc.
 *
 * Regardless, so long as dependencies are managed correctly, the build process
 * will automatically take take of the rest.
 *
 * The dependencies block here is also where component dependencies should be
 * specified, as shown below.
 */
angular.module( 'mountainApp.home', [
  'ui.router'
])

/**
 * Each section or module of the site can also have its own routes. AngularJS
 * will handle ensuring they are all available at run-time, but splitting it
 * this way makes each module more "self-contained".
 */
.config(function config( $stateProvider ) {
  $stateProvider.state( 'home', {
    url: '/home',
    views: {
      "main": {
        controller: 'HomeCtrl',
        templateUrl: 'home/home.tpl.html'
      }
    },
    data:{ pageTitle: 'Home' }
  });
})

/**
 * And of course we define a controller for our route.
 */
.controller( 'HomeCtrl', function HomeController( $scope, $http, $interval, $modal ) {

  $http.get('https://dl.dropboxusercontent.com/s/vocvzmu09bmzf53/home-page.json').success(function(data) {
    $scope.data = data;
    calculatePC();
    $scope.slideRight = function() {
      $(".team,.about-us").toggleClass("left");
      $(".team,.about-us").toggleClass("right");
    };
    $scope.slideLeft = function() {
      $(".team,.about-us").toggleClass("right");
      $(".team,.about-us").toggleClass("left");
    };
  });

  calculatePC = function() {
    $scope.data.pc = $scope.data.current/$scope.data.goal * 100;
    $scope.data.currentString = "$"+$scope.data.current.toFixed(0).replace(/(\d)(?=(\d{3})+$)/g, "$1,");    
    $scope.data.goalString = "$"+(""+$scope.data.goal).replace(/(\d)(?=(\d{3})+$)/g, "$1,");
  };

  $scope.openDonor = function() {
    console.log($scope.data.donors);
    var modalInstance = $modal.open({
      templateUrl: 'home/donor.tpl.html',
      controller: 'ModalInstanceCtrl',
      size: 'lg',
      resolve: {
        donors: function() {
          return $scope.data.donors;
        }
      }
    });
  };
})

.controller('ModalInstanceCtrl', function($scope, $modalInstance, donors) {
  $scope.donors = donors;
  $scope.close = function() {
    $modalInstance.close();
  };
})

.directive('fullHeight', function($window) {
  return {
    restrict: 'A',
    link: function(scope,element,attr) {
      //element.css({'height':$window.innerHeight+'px'});
    }
  };
})

.directive('snappish', function($window) {
  return {
    restrict: 'A',
    link: function(scope,element,attr) {
      element.snappish();
    }
  };
});
