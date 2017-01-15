(function() {
  angular.module('skilly')
    .factory('api', ['$http', '$q', function($http, $q) {

      var api = {};

      // ---------- Demands -----------

      api.postDemand = function(demand) {
        return $http.put('https://api-sb.herokuapp.com/demands', demand);
      }

      // ---------- Messages -----------

      api.getConversations = function(userId) {
        var url = 'https://api-sb.herokuapp.com/conversations.json';
        url += "?user_id1=" + userId;
        url += "&user_id2=" + userId;

        return $http.get(url);
      }

      // ---------- Users -----------

      api.getUser = function(userId) {
        var url = 'https://api-sb.herokuapp.com/users.json';
        url += "?user_id=" + userId;
        return $http.get(url);
      }

      return api;

    }]);
})();
