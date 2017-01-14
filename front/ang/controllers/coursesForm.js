(function() {
  angular.module('skilly')
    .controller('CoursesFormController',
      ['$http', '$sessionStorage', '$scope', '$q', '$location', 'users', 'courses',
      function($http, $sessionStorage, $scope, $q, $location, users, courses) {
        var coursesFormCtrl = this;

        $scope.checkLogin = function() {
          if (! $scope.$storage.hasOwnProperty("user")) {
            $location.path("/needlogin");
          }
        }

        $scope.submitAskForCourse = function(course) {
          $scope.checkLogin();
          console.log("User id : " + $scope.$storage.user.id);
          console.log($scope.$storage.user);
          course.user_id = $scope.$storage.user.id;

          var valid = true;

          valid = valid && course.title.length !== 0;
          valid = valid && course.description !== 0;
          valid = valid && course.location !== 0;

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
      }
    ]);
})();
