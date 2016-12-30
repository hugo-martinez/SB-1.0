(function() {
  angular.module('skilly')
    .controller('HeaderController', ['$http', '$sessionStorage', '$scope', '$q',
      function($http, $sessionStorage, $scope, $q) {
        var self = this;

        var transitionTime = 400;

        $scope.switchTeachLearn = function() {
          if ($scope.isTeacher == true) {
            window.location.href = "/#/teach";
            $('header').css('border-color', 'rgba(255, 102, 102, 0.7)');
          } else {
            window.location.href = "/#/learn";
            $('header').css('border-color', 'rgba(51, 153, 153, 0.7');
          }
        }
      }
    ]);
})();
