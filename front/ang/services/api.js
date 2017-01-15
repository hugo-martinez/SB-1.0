(function() {
  angular.module('skilly')
    .factory('api', ['$http', '$q', function($http, $q) {

      var api = {};

      api.postDemand = function(demand) {
        return $http.put('https://api-sb.herokuapp.com/demands', demand);
      }

      return api;

    }]);
})();
