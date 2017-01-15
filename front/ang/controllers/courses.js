(function() {
  angular.module('skilly-courses')
    .controller('CoursesController',
    ['$http', '$scope', 'googleMaps', 'courses', '$location',
      function($http, $scope, googleMaps, courses, $location) {

        var ctrl = this;
        $scope.courses = [];
        $scope.coursesLoaded = false;

        $scope.isAuthentificated = function(){
          return $scope.$storage.userAccess;
        }

        $scope.loadCourses = function() {
          var promise = courses.getCourses();
          console.log("Received promise type of : " + typeof promise);
          promise.then(function(data) {
            $scope.courses = data.data;
          }, function(data) {
            console.log("Error fetching courses using courses service.");
            $location.path('/500');
          });
        }

        $scope.triggerSearch = function() {
          if (! $scope.coursesLoaded) {
            $scope.loadCourses();
          }
          var tmpCourses = []
          console.log("triggerSearch called with searchString : " + $scope.searchString);
          $scope.courses.forEach(function(crs) {
            if (courses.coursePrefixMatch(crs, $scope.searchString)) {
              tmpCourses.push(crs);
            }
            $scope.courses = tmpCourses;
          });
        }

        $scope.$watch(
          function(scope) { return scope.searchString; },
          function() {
            $scope.triggerSearch();
          }
        );
      }
    ]);


})();
