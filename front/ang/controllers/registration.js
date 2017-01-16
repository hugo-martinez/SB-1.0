(function() {
  angular.module("skilly-courses")
  .controller('RegistrationController',
  ['$http', '$scope', 'api', 'users', '$location', '$routeParams',
  function($http, $scope, api, users, $location, $routeParams) {
    var ctrl = this;

    $scope.course = {};

    console.log("FullCourseController loaded");

    $scope.courseId = $routeParams.courseId;
    if (isNaN($scope.courseId)) {
      $location.path("/404");
    } else {
      $scope.courseId = parseInt($scope.courseId);
    }

    $scope.checkLogin = function() {
      if (! $scope.$storage.hasOwnProperty("user")) {
        $location.path("/needlogin");
      }
    };
    $scope.checkLogin();

    $scope.loadPrice = function() {
      api.getCourse($scope.courseId)
      .then(function(resp) {
        $scope.price = resp.data.cost;
      }, function(error) {
        console.log("Error fetching price for registration confirmation.");
        console.log(error);
        $location.path('/500');
      })
    };

    $scope.register = function() {
      return;
    };

  }]);
})();
