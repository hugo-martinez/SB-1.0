(function() {
  angular.module('skilly')
    .factory('api', ['$http', '$q', function($http, $q) {

      var api = {};

      // ---------- Demands -----------

      api.postDemand = function(demand) {
        return $http.post('https://api-sb.herokuapp.com/demands', demand);
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

      api.postMessage = function(message) {
        return $http.post('https://api-sb.herokuapp.com/messages', message);
      }

      // ---------- Users -----------

      api.getUser = function(userId) {
        var url = 'https://api-sb.herokuapp.com/users/';
        url += userId + ".json";
        return $http.get(url);
      }

      // ---------- Courses -----------

      api.getCourse = function(courseId) {
        var url = "https://api-sb.herokuapp.com/courses/";
        url += courseId + ".json";
        return $http.get(url);
      }

      api.getAllCourses = function() {
        var url = "https://api-sb.herokuapp.com/courses.json";
        return $http.get(url);
      }

      api.registerLessonFromCourse = function(pupilId, courseId) {
        var deffered = $q.defer();
        api.getCourse(courseId)
        .then(function(resp1) {
          var lesson = {
            teacher_id: resp1.data.user_id,
            origin_id: 0,
            course_origin: courseId,
            pupil_id: pupilId,
            evolution: 0,
            location: resp1.data.location,
            cost: resp1.data.cost
          };
          console.log("Registering lesson :");
          console.log(lesson);
          $http.post('https://api-sb.herokuapp.com/lessons', lesson)
          .then(function(success) {
            deffered.resolve('Creation successful');
          }, function(error) {
            deffered.reject(error);
          });
        }, function(error) {
          deffered.reject(error);
        });
        return deffered.promise;
      }

      // ---------- Lessons -----------

      api.getAllLessons = function() {
        var url = "https://api-sb.herokuapp.com/lessons.json";
        return $http.get(url);
      }

      return api;

    }]);
})();
