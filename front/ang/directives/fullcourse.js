(function(){
  angular.module('skilly-courses').directive('fullcourse', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/templates/fullcourse.html',
      controller: "FullCourseController",
      controllerAs: "fcCtrl"
    };
  });
})();
