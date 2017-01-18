(function(){
  angular.module('skilly-courses').directive('course', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/templates/course.html',
      scope: {
        course: '='
      }
    };
  });
})();
