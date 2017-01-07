(function() {
  angular.module('skilly')
    .controller('CoursesManagementController', ['$http', '$sessionStorage', '$scope', '$q',
      function($http, $sessionStorage, $scope, $q) {
        var selfRef = this;

        selfRef.newCourse = function(course) {

          $http.post('').then(function(response) {
            console.log(response);
          });

        }

        var coursetest = {
          "user_id": 1,
          "theme_id": 1,
          "title": "Vulgarisation du vocabulaire",
          "description": "Cours destiné aux étrangers qui souhaitent apprendre à insulter correctement, par exemple l'administration française dans le cadre de n'importe quelle démarche les impliquant.",
          "cost": 110,
          "location": "Par là",
          "photo": "img/courses/fuck.jpg"
        };
        
        selfRef.newCourse(coursetest);
      }
    ]);
})();