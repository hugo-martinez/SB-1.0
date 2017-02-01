(function() {
  angular.module('skilly')
    .controller('DashboardController', [
      '$scope', '$location', '$http', 'api',
      function($scope, $location, $http, api) {
        var self = this;

        $scope.attendsCourses = false;
        $scope.teachesLessons = false;

        new Morris.Donut({
          element: "studTeach-chart",
          colors: [
            "#339999",
            "#ff6666"
          ],
          data: [
            {label: "Cours suivis", value: 6},
            {label: "Cours donnés", value: 8}
          ]
        });

        $scope.checkLogin = function() {
          if (! $scope.$storage.hasOwnProperty("user")) {
            $location.path("/needlogin");
          }
        };
        $scope.checkLogin();

        //Retrieve user's data
        api.getUser($scope.$storage.user.id)
        .then(function(resp) {
          $scope.user = {
            firstName: resp.data.first_name,
            lastName: resp.data.last_name,
            nSkilly: resp.data.nb_skilly,
            email: resp.data.email
          }
        }, function(error) {
          console.log("Error retrieving user's data for dashboard.");
          console.log(error);
          $location.path('/500');
        })
      }

      // Load current courses
      $scope.loadCurrentCourses = function() {
        $scope.coursesAttended = [];
        $scope.lessonsTaught = [];

        api.getUserCourses($scope.$storage.user.id)
        .then(function(resp) {
          if (resp.data.length != 0) {
            $scope.attendsCourses  = true;
            $scope.coursesAttended = resp.data;
          }
        }, function(error) {
          console.log("Error trying to fetch courses attended");
          console.log(error);
          $location.path('/500');
        });

        api.getLessonsTaught($scope.$storage.user.id)
        .then(function(resp) {
          if (resp.data.length != 0) {
            $scope.teachesLessons = true;
            $scope.lessonsTaught = resp.data;
          }
        }, function(error) {
          console.log("Error trying to fetch lessons taught.");
          console.log(error);
          $location.path('/500');
        });
      }
    ]);
})();
