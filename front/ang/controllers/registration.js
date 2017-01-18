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
      api.getAllLessons()
      .then(function(resp) {
        var lessons = resp.data;
        console.log("Processing lessons :");
        console.log(lessons);
        var nLessons = resp.data.length;
        var skilliesSpent = 0;
        for (var i = 0; i < nLessons; i++) {
          console.log("Processing lesson : ");
          console.log(lessons[i]);
          if (lessons[i].pupil_id == $scope.$storage.user.id &&
            lessons[i].evolution == 0) {
            console.log("Yo");
            skilliesSpent += lessons[i].cost;
          }
        }
        console.log(skilliesSpent + $scope.price);
        console.log($scope.price);
        console.log($scope.$storage.user.nb_skilly);
        if (skilliesSpent + $scope.price > $scope.$storage.user.nb_skilly) {
          console.log("Not enough skillies to register");
          $location.path('/notenoughskillies');
        } else {
          api.registerLessonFromCourse($scope.$storage.user.id, $scope.courseId)
          .then(function(succes) {
            console.log("Lesson successfully registered.");
            // $location.path(lol);
          }, function(error) {
            console.log("Error during registration : ");
            console.log(error);
            $location.path('/500');
          });
        }
      }, function(error) {
        console.log("Error trying to fetch all courses to check skilly fund");
        console.log(error);
        $location.path('/500');
      })
    };

  }]);
})();
