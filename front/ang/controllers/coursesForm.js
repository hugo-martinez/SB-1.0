(function() {
  angular.module('skilly')
    .controller('CoursesFormController',
      ['$http', '$sessionStorage', '$scope',
      '$q', '$location', 'users', 'courses', 'api',
      function($http, $sessionStorage, $scope, $q, $location, users, courses) {
        var coursesFormCtrl = this;

        $scope.checkLogin = function() {
          if (! $scope.$storage.hasOwnProperty("user")) {
            $location.path("/needlogin");
          }
        }

        $scope.publishCourse = function(course) {
          $scope.checkLogin();
          course.user_id = $scope.$storage.user.id;

          var valid = true;

          valid = valid &&
            typeof course.title !== "undefined" &&
            course.title.length !== 0 &&
            typeof course.description !== "undefined" &&
            course.description.length !== 0 &&
            typeof course.cost !== "undefined" &&
            course.cost.length !== 0 &&
            typeof course.location !== "undefined" &&
            course.location.length !== 0;


          if (valid) {
            courses.
            postCourse($scope.course).
            then(function(course) {
              console.log("Course posted");
              $location.path("/courseposted");
            }, function(error) {
              $scope.invalidData = true;
            });
          } else {
            $scope.invalidSubmission = true;
          }

        }

        $scope.publishDemand = function(demand) {
          $scope.checkLogin();
          demand.user_id = $scope.$storage.user.id;

          var valid = true;

          valid = valid &&
            typeof course.title !== "undefined" &&
            course.title.length !== 0 &&
            typeof course.description !== "undefined" &&
            course.description.length !== 0 &&
            typeof course.cost !== "undefined" &&
            course.cost.length !== 0 &&
            typeof course.location !== "undefined" &&
            course.location.length !== 0;
        }
      }
    ]);
})();
