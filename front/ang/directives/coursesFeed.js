(function() {
  angular.module('skilly-courses').directive('coursesFeed', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/templates/coursesFeed.html',
      controller: "CoursesController",
      controllerAs: "coursesCtrl"
    };
  });
})();
