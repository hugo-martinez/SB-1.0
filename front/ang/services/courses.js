(function() {
  angular.module('skilly')
    .factory('courses', ['$http', '$q', function($http, $q) {

      var courses = {};

      courses.coursePrefixMatch = function(course, searchString) {
        if (course.title == null) {
          console.log(course);
          throw TypeError();
        }
        var string = String(course.title).toUpperCase();
        var stringLength = string.length;
        if (searchString === undefined || searchString === "") { //Si pas de recherche tout est OK
          return true;
        }
        searchString = String(searchString).toUpperCase();
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
      }

      courses.getCourses = function() {
        console.log("Service courses : getCourses");
        return $http.get('https://api-sb.herokuapp.com/courses.json');
      };

      courses.postCourse = function(course) {
        // Insérer vérifications ici

        return $http.post('https://api-sb.herokuapp.com/courses', course);
      };

      return courses;

    }]);
})();
