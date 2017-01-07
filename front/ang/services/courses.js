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

      // Get one or more courses
      // If an incomplete course is passed as argument, it is used as a filter
      courses.getCourses = function(courseFilterArg) {
        var url = 'https://api-sb.herokuapp.com/courses.json';
        var courseFilter = (typeof courseFilterArg !== "undefined")
          ? courseFilterArg
          : {};
        var args = "";
        if (courseFilter.hasOwnProperty("id")) {
          args = args.concat(courseFilter.id);
        }
        if (courseFilter.hasOwnProperty("user_name")) {
          args = args.concat(courseFilter.user_name);
        }
        if (courseFilter.hasOwnProperty("first_name")) {
          args = args.concat(courseFilter.first_name);
        }
        if (courseFilter.hasOwnProperty("last_name")) {
          args = args.concat(courseFilter.last_name);
        }
        if (courseFilter.hasOwnProperty("email")) {
          args = args.concat(courseFilter.email);
        }
        if (courseFilter.hasOwnProperty("location")) {
          args = args.concat(courseFilter.location);
        }
        console.log("Service courses : getCourses");
        return $http.get(url);
      };

      // Add a course
      courses.postCourse = function(course) {
        // #TODO Insérer vérifications ici

        return $http.post('https://api-sb.herokuapp.com/courses', course);
      };

      // Edit a course
      courses.editCourse = function(course) {
        // #TODO Insérer vérifications ici

        return $http.put('https://api-sb.herokuapp.com/courses', course);
      }

      // Delete a course
      courses.deleteCourse = function(course, userCredentials) {
        // #TODO Vérifier que l'utilisateur est logged in et que le cours lui
        // appartient

        return $http.delete('https://api-sb.herokuapp.com/courses', course);
      }

      return courses;

    }]);
})();
