(function() {
  angular.module('skilly-courses')
    .controller('CoursesController', ['$http', '$scope', 'googleMaps',
      function($http, $scope, googleMaps) {
        var ctrl = this;
        $scope.courses = [];

        $scope.isAuthentificated = function(){
          return $scope.$storage.userAccess;
        }

        // Vérifie que this.title est un prefix de searchString
        // Insensible à la casse
        ctrl.matchSearchAux = function(course) {
          if (course.title == null) {
            console.log(course);
            throw TypeError();
          }
          var string = String(course.title).toUpperCase();
          if ($scope.searchString && toString.call($scope.search) == '[object RegExp]') {
            throw TypeError();
          }
          var stringLength = string.length;
          if ($scope.searchString === undefined || $scope.searchString === "") { //Si pas de recherche tout est OK
            return true;
          }
          var searchString = String($scope.searchString).toUpperCase();
          var searchLength = searchString.length;
          var position = arguments.length > 1 ? arguments[1] : undefined;
          // `ToInteger`
          var pos = position ? Number(position) : 0;
          if (pos != pos) { // better `isNaN`
            pos = 0;
          }
          var start = Math.min(Math.max(pos, 0), stringLength);
          // Avoid the `indexOf` call if no match is possible
          if (searchLength + start > stringLength) {
            return false;
          }
          var index = -1;
          while (++index < searchLength) {

            if (string.charCodeAt(start + index) != searchString.charCodeAt(index)) {
              return false;
            }
          }
          return true;
        };

        $scope.triggerSearch = function() {
          return;
        }


        $http.get('https://api-sb.herokuapp.com/courses.json').success(function(data) {
          $scope.courses = data;
          console.log($scope.courses);
          window.MY_SCOPE = $scope;
          var n = $scope.courses.length;
          var response;
          for (var i = 0; i < n; i++) {
            response = googleMaps.findFromId("ChIJ7ZbVdz5w5kcRwtlG_IqxhmM");
          }
        });
      }
    ]);


})();
