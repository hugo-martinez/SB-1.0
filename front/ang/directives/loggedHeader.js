(function() {
  angular.module('skilly').directive('loggedHeader', function() {
    return {
      restrict: 'A',
      templateUrl: '/ang/directives/templates/loggedHeader.html',
    };
  });
})();