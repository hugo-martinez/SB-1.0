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
      }
    ]);
})();
