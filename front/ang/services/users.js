(function() {
  angular.module('skilly')
    .factory('users', ['$http', '$q', '$sessionStorage', '$scope',
    function($http, $q, $sessionStorage, $scope) {

      // #TODO integrate this service into authController

      var users = {};

      // #TODO à tester

      users.login = function(user_name, password) {
        var deffered = $q.defer();

        if (typeof user_name === "undefined" || typeof password === undefined) {
          deffered.reject("Invalid arguments.");
        } else {
          url = 'https://api-sb.herokuapp.com/users/search.json?user_name=';
          url = url.concat($scope.user.pseudo);
          $http.get(url).then(function(response) {
            if (response.error) {
              deffered.reject("Error on the server-side when trying to log in.");
            } else {
              $scope.$storage.user = response;
              $scope.$storage.userAccess = $scope.$storage.userRoles.user;
              deffered.resolve(response);
            }
          }, function(response) {
            deffered.reject("Http request error when trying to log in.");
          });
        }

        return deffered.promise;
      };

      users.logout = function() {
        delete $scope.$storage.user;
        delete $scope.$storage.userAccess;
      }

      return users;

    }]);
})();
