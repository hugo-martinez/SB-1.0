(function() {
  angular.module('skilly').directive('anonHeader', function() {
    return {
      restrict: 'A',
      templateUrl: 'ang/directives/templates/anonHeader.html',
    };
  });
})();
