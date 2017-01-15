(function() {
  angular.module("skilly-courses")
  .controller('MessagingController',
  ['$http', '$scope', 'api', 'users', '$location',
  function($http, $scope, api, users, $location) {
    var ctrl = this;

    console.log("MessagingController initiated");

    $scope.checkLogin = function() {
      if (! $scope.$storage.hasOwnProperty("user")) {
        $location.path("/needlogin");
      }
    }
    $scope.checkLogin();

    $scope.conversations = [];

    $scope.loadConversations = function() {
      console.log("Loading conversations");
      var promise = api.getConversations($scope.$storage.user.id);
      promise.then(function(resp) {
        var rawConversations = resp.data;
        var convBuffer = [];
        console.log(rawConversations);
        var nConv = rawConversations.length;
        for (var i = 0; i < nConv; i++) {
          var rawConv = rawConversations[i];
          var conv = {};
          console.log("Processing conv : ");
          console.log(rawConv);
          api.getUser(rawConv.user_id1).then(function(user1) {
              api.getUser(rawConv.user_id2).then(function(user2) {
                if (user1.data.id != $scope.$storage.id) {
                  console.log("Setting sender : ");
                  console.log(user1.data[0]);
                  conv.sender = {
                    id: user1.data[0].id,
                    firstName: user1.data[0].first_name,
                  }
                } else {
                  console.log("Setting sender : ");
                  console.log(user2.data[0]);
                  conv.sender = {
                    id: user2.data[0].id,
                    firstName: user2.data[0].first_name,
                  }
                }
                convBuffer.push(conv);
              });
          });
          $scope.conversations = convBuffer;
        }
        console.log($scope.conversations);
      }, function(data) {
        console.log("Error fetching conversations : ");
        console.log(data);
        $location.path('/500');
      });
    }


  }]);
})();
