(function() {
  angular.module("skilly-courses")
  .controller('ChatController',
  ['$http', '$scope', 'api', 'users', '$location', '$routeParams',
  function($http, $scope, api, users, $location, $routeParams) {
    var ctrl = this;

    $scope.checkLogin = function() {
      if (! $scope.$storage.hasOwnProperty("user")) {
        $location.path("/needlogin");
      }
    }
    $scope.checkLogin();

    $scope.convId = $routeParams.convid;
    if (isNaN($scope.convId)) {
      $location.path("/500");
    } else {
      $scope.convId = parseInt($scope.convId);
    }

    $scope.messages = [];

    function loadInterloc() {
      if (! $scope.hasOwnProperty("interloc")) {
        api.getConversation($scope.convId)
        .then(function(conv) {
          console.log("Trying to fetch this fucking damn id");
          console.log(conv);
          var interId = conv.data.user_id1 == $scope.$storage.user.id ?
            conv.data.user_id2:
            conv.data.user_id1;
          api.getUser(interId)
          .then(function(resp) {
            console.log("Here we try to fetch the fucking interlocutor");
            console.log(resp);
            $scope.interloc = {
              name: resp.data.first_name,
            };
            console.log("Interlocutor : " + $scope.interloc.name);
          }, function(error) {
            console.log("Error fetching the interlocutor infos.");
            console.log(error);
            $location.path("/500");
          });
        }, function(error) {
          console.log("Error fetching the interlocutor.");
          console.log(error);
          $location.path("/500");
        })
      }
    }

    $scope.loadMessages = function() {
      loadInterloc();
      console.log("Loading messages for chat");
      var prom = api.getMessages($scope.convId);
      prom.then(function(resp) {
        var rawMessages = resp.data;
        var messages = [];
        console.log("Processing messages : ");
        console.log(rawMessages);
        nMessages = rawMessages.length;
        for (var i = 0; i < nMessages; i++) {
          htmlClass = (rawMessages[i].user_id == $scope.$storage.user.id) ?
            "sent" :
            "received";
          var message = {
            class: htmlClass,
            dateTime: rawMessages[i].time,
            content: rawMessages[i].msg,
          };
          messages.push(message);
        }
        messages.sort(function(m1, m2) {
          if (m1.dateTime < m2.dateTime) {return -1;}
          if (m1.dateTime > m2.dateTime) {return 1;}
          return 0;
        });
        $scope.messages = messages;
        console.log("Messages loaded");
        console.log($scope.messages);
      }, function(error) {
        console.log("Error fetching messages for chat :");
        console.log(error);
        $location.path("/500");
      })
    }

  }]);
})();
