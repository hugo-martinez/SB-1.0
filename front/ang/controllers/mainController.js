(function() {
  angular.module('skilly')
    .controller('MainController', ['$http', '$scope', '$sessionStorage',
      function($http, $scope, $sessionStorage) {
        var userRoles = {
          public: 1, // 001
          user: 2, //010
          admin: 4, //100
        };
        
        var accessLevels = {
          public: userRoles.public |
            userRoles.user |
            userRoles.admin, // 111
          user: userRoles.user |
            userRoles.admin, // 110
          admin: userRoles.admin // 100
        };
        // Initialisation des variables de session
        $scope.$storage = $sessionStorage.$default({
          userRoles: userRoles,
          accessLevels: accessLevels
        });
      }
    ]);
})();