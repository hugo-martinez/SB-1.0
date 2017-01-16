(function() {
  angular.module("skilly-courses")
  .controller('FullCourseController',
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

    $scope.loadCourse = function() {
      console.log("courseId : " + $scope.courseId);
      api.getCourse($scope.courseId)
      .then(function(resp) {
        $scope.course = {
          id: $scope.courseId,
          title: resp.data.title,
          description: resp.data.description,
          cost: resp.data.cost,
          location: resp.data.location,
          teacherId: resp.data.user_id,
        };
        api.getUser($scope.course.teacherId)
        .then(function(resp) {
          $scope.course.teacher = {
            firstName: resp.data.first_name,
          };
          console.log("Teacher is loaded :");
          console.log($scope.course.teacher);
        }, function(error) {
          console.log("Error fetching teacher's data.");
          console.log(error);
          $location.path('/500');
        })
        console.log("Course loaded");
        console.log($scope.course);
      }, function(error) {
        console.log("Error fetching course to display course's details.");
        console.log(error);
        $location.path("/404");
      })
    };

  }]);
})();
