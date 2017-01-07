(function() {
  angular.module('skilly-courses').directive('coursesFeed', function() {
    return {
      restrict: 'E',
      templateUrl: 'ang/directives/templates/profile.html',
      controller: "ProfileController",
      controllerAs: "profileCtrl",
      scope: {
        user_id: '=',
      }
    };
  });
})();
