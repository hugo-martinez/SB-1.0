(function() {
  angular.module('skilly-courses', []);

  angular.module('skilly-courses').filter('capitalize', function() {
    return function(input) {
      return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
    };
  });

  angular.module('skilly-courses').filter('utcToTime', function() {
    return function(input) {
      return input.substring(11, 16);
    }
  });

  angular.module('skilly-courses').filter('initial', function() {
    return function(input) {
      return input.substring(0, 1).toUpperCase() + '.';
    }
  });
})();
