(function() {
  angular.module('skilly')
    .controller('AuthController',
      ['$http', '$sessionStorage', '$scope', '$q', '$location', 'users',
      function($http, $sessionStorage, $scope, $q, $location, users) {
        var authCtrl = this;

        authCtrl.login = function() {
          users.
          login($scope.user.pseudo, $scope.user.pwd).
          then(function(user) {
            $scope.$storage.user = user.data;
            $scope.$storage.userAccess = $scope.$storage.userRoles.user;
            $location.path('/account/dashboard');
          }, function(error) {
            $scope.invalidCredentials = true;
            console.log(error);
          });
        }

        authCtrl.logout = function() {
          console.log("logout clicked");
          delete $scope.$storage.user;
          delete $scope.$storage.userAccess;
          $location.path('/learn');
        };
      }
    ]);
})();
