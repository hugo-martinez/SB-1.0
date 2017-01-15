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
        var url = 'https://api-sb.herokuapp.com/conversations/search.json';
        url += "?user_id1=" + userId;
        url += "&user_id2=" + userId;

        return $http.get(url);
      }

      api.getConversation = function(convId) {
        var url = 'https://api-sb.herokuapp.com/conversations/';
        url += convId + ".json" ;
        return $http.get(url);
      }

      api.getMessages = function(convId) {
        var url = 'https://api-sb.herokuapp.com/messages/search.json';
        url += "?conv_id=" + convId;
        return $http.get(url);
      }

      // ---------- Users -----------

      api.getUser = function(userId) {
        var url = 'https://api-sb.herokuapp.com/users/';
        url += userId + ".json";
        return $http.get(url);
      }

      return api;

    }]);
})();
