(function() {
  angular.module('skilly-courses').directive('conversation', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/messaging/conversation.html',
      scope: {
        conversation: '='
      }
    };
  });
})();
