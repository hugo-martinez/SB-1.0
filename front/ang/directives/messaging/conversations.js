(function() {
  angular.module('skilly-courses').directive('conversations', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/messaging/conversations.html',
      controller: "MessagingController",
      controllerAs: "msgCtrl"
    };
  });
})();
