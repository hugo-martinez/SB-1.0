(function() {
  angular.module('skilly-courses').directive('chat', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/messaging/chat.html',
      controller: "ChatController",
      controllerAs: "chatCtrl"
    };
  });
})();
