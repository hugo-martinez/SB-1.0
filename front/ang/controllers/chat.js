(function() {
  angular.module("skilly-courses")
  .controller('ChatController',
  ['$http', '$scope', 'api', 'users', '$location', '$routeParams',
  function($http, $scope, api, users, $location, $routeParams) {
    var ctrl = this;
    ctrl.lastMessageDT = '1970-01-01T00:00:00.902Z';
    ctrl.refreshPeriod = [2000, 5000, 10000, 30000];
    ctrl.cycleDuration = [10000, 30000, 30000, -1];
    ctrl.currentCountdown = ctrl.cycleDuration[0];
    ctrl.cycleCursor = 0;

    $scope.checkLogin = function() {
      if (! $scope.$storage.hasOwnProperty("user")) {
        $location.path("/needlogin");
      }
    }
    $scope.checkLogin();

    var date = new Date();
    console.log(date.toISOString());

    var testmessage = {
      conv_id: 1,
      msg: "Date test",
      user_id: 1
    }

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
          var interId = conv.data.user_id1 == $scope.$storage.user.id ?
            conv.data.user_id2:
            conv.data.user_id1;
          api.getUser(interId)
          .then(function(resp) {
            $scope.interloc = {
              name: resp.data.first_name,
            };
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
    };

    $scope.loadMessages = function() {
      loadInterloc();
      var prom = api.getMessages($scope.convId);
      prom.then(function(resp) {
        var rawMessages = resp.data;
        var messages = [];
        nMessages = rawMessages.length;
        for (var i = 0; i < nMessages; i++) {
          var htmlClass = (rawMessages[i].user_id == $scope.$storage.user.id) ?
            "sent" :
            "received";
          var message = {
            class: htmlClass,
            dateTime: rawMessages[i].time,
            content: rawMessages[i].msg,
          };
          if (message.dateTime > ctrl.lastMessageDT) {
            ctrl.lastMessageDT = message.dateTime;
          }
          messages.push(message);
        }
        messages.sort(function(m1, m2) {
          if (m1.dateTime < m2.dateTime) {return -1;}
          if (m1.dateTime > m2.dateTime) {return 1;}
          return 0;
        });
        $scope.messages = messages;
      }, function(error) {
        console.log("Error fetching messages for chat :");
        console.log(error);
        $location.path("/500");
      })
      ctrl.callRefresh();
    };

    ctrl.postMessage = function() {
      $scope.checkLogin();
      var backMessage = {
        conv_id: $scope.convId,
        msg: $scope.msg.content,
        user_id: $scope.$storage.user.id
      };

      api.postMessage(backMessage)
      .then(function(success) {
        $scope.msg.content = "";
        ctrl.refresh();
      }, function(error) {
        console.log("Error while trying to send message.");
        console.log(error);
        $location.path('/500');
      })
    }

    $("#input-field").keydown(function(e) {
      if (e.keyCode == 13) {
        e.preventDefault();
        ctrl.postMessage();
      }
    });

    // Use callRefresh to launch automatic refreshing
    ctrl.refresh = function() {
      $scope.checkLogin();
      var prom = api.getMessages($scope.convId);
      prom.then(function(resp) {
        var rawMessages = resp.data;
        var nMessages = rawMessages.length;
        for (var j = 0; j < nMessages; j++) {
          if (rawMessages[j].time > ctrl.lastMessageDT) {
            var htmlClass = (rawMessages[j].user_id == $scope.$storage.user.id) ?
              "sent" :
              "received";
            var message = {
              class: htmlClass,
              dateTime: rawMessages[j].time,
              content: rawMessages[j].msg,
            };
            ctrl.lastMessageDT = message.dateTime;
            $scope.messages.push(message);
          }
        }
      }, function(error) {
        console.log("Error while trying to refresh messages from the user chat.");
        console.log(error);
        $location.path('/500');
      });
    };

    ctrl.callRefresh = function() {
      var refreshPeriod = ctrl.refreshPeriod[ctrl.cycleCursor];
      ctrl.refresh();
      setTimeout(function() {
        ctrl.callRefresh();
      }, refreshPeriod);
      var cycleDuration = ctrl.cycleDuration[ctrl.cycleCursor];
      if (ctrl.currentCountdown <= 0 && cycleDuration != -1) {
        ctrl.cycleCursor ++;
        ctrl.currentCountdown = ctrl.cycleDuration[ctrl.cycleCursor];
      }
    };
  }]);
})();
