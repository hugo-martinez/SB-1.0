(function() {
  
  angular.module('skilly-courses').directive('coursesMap', function() {
    return {
      restrict: 'E',
      templateUrl: '/ang/directives/templates/coursesMap.html',
      controller: 'CoursesMapController',
      controllerAs: 'coursesMapCtrl',
      scope: {
        courses: '=',
        showMap: '='
      }
    };
  });

})();