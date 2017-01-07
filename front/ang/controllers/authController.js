(function() {
  angular.module('skilly')
    .controller('AuthController', ['$http', '$sessionStorage', '$scope', '$q', '$location',
      function($http, $sessionStorage, $scope, $q, $location) {
        var authCtrl = this;

        authCtrl.login = function() {
          console.log($scope.user);
          if ($scope.user && $scope.user.pseudo) {
            $http
              .get('https://api-sb.herokuapp.com/users/search.json?user_name=' + $scope.user.pseudo)
              .then(function(response) {
                if (response.error) {
                  console.log('Error encountered during authentification. Error message : ' + response.error);
                } else {
                  console.log(response);
                  $scope.$storage.user = response;
                  $scope.$storage.userAccess = $scope.$storage.userRoles.user;
                  $location.path('/#/learn');
                }
              });

          } else {

          }
        };

        authCtrl.logout = function() {
          console.log("logout clicked");
          delete $scope.$storage.user;
          delete $scope.$storage.userAccess;
          $location.path('');
        };
      }
    ]);
})();
