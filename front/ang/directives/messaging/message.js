(function() {
  angular.module('skilly-courses').directive('message', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/messaging/message.html',
      scope: {
        message: "=",
      }
    };
  });
})();
