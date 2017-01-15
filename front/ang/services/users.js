(function() {
  angular.module('skilly')
    .factory('users', ['$http', '$q',
    function($http, $q) {

      // #TODO integrate this service into authController

      var users = {};

      // #TODO à tester

      users.login = function(email, password) {
        var deffered = $q.defer();

        if (typeof email === "undefined" || typeof password === undefined) {
          deffered.reject("Invalid arguments.");
        } else {
          url = 'https://api-sb.herokuapp.com/users/search.json?email=';
          url = url.concat(email);
          url = url.concat("&password=");
          url = url.concat(password);
          $http.get(url).then(function(response) {
            if (response.data.error) {
              deffered.reject("Error on the server-side when trying to log in.");
            } else {
              deffered.resolve(response);
            }
          }, function(response) {
            deffered.reject("Http request error when trying to log in.");
          });
        }

        return deffered.promise;
      };


      return users;

    }]);
})();
