(function() {
  angular.module('skilly')
    .controller('HeaderController', [
      '$http', '$sessionStorage', '$scope', '$q', '$location',
      function($http, $sessionStorage, $scope, $q, $location) {
        var self = this;

        var transitionTime = 400;

        $scope.switchTeachLearn = function() {
          if ($scope.isTeacher == true) {
            window.location.href = "/#/teach";
            $('header').css('border-color', 'rgba(255, 102, 102, 0.7)');
            $('#footer').css('border-color', 'rgba(255, 102, 102, 0.7)');
          } else {
            window.location.href = "/#/learn";
            $('header').css('border-color', 'rgba(51, 153, 153, 0.7');
            $('#footer').css('border-color', 'rgba(51, 153, 153, 0.7');
          }
        }


        // On trigger le click sur le bouton si on est arrivé sur la page
        // sans l'utiliser
        var patt = /\/teach/;
        var switchBtn = $('.switch input');
        //console.log("Hello you");
        //console.log($scope.isTeacher);
        //console.log(switchBtn);
        //console.log($location.absUrl());
        //console.log(patt.test($location.absUrl()));
        if (
          typeof $scope.isTeacher == 'undefined'
          && patt.test($location.absUrl())
        ) {
          //console.log("Going in");
          $('.switch').trigger('click');
        }
        //console.log($scope.isTeacher);
      }
    ]);
})();
