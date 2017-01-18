(function() {
  angular.module('skilly-courses')
    .controller('CoursesMapController', ['$http', '$scope', '$q', 'googleMaps',
      function($http, $scope, $q, googleMaps) {
        var mapCtrl = this;

        mapCtrl.updateCourses = function() {
          var deferred = $q.defer();

          var length = $scope.courses.length;
          var reasons = "";
            console.log("Length : " + length);
          for (var i = 0; i < length; i++) {
            if (!$scope.courses[i].place) {
              googleMaps.findFromId($scope.courses[i].position)
                .then(function(result) {
                  $scope.courses[i].place = result;
                }, function(reason) {
                  reasons += reason + "\n";
                });
            }
          }
          if (reasons === "") {
            deferred.resolve();
          } else {
            deferred.reject(reasons);
          }
          return deferred.promise;
        }

        mapCtrl.showMapFn = function() {
          mapCtrl.updateCourses().then(function() {
            if (mapCtrl.map) {
              setTimeout(function() {
                mapCtrl.updateMap();
                google.maps.event.trigger(mapCtrl.map, 'resize');
              }, 10);
            }
          }, function(reason) {
            console.log("From showMapFn:" + reason);
          });
          return $scope.showMap;
        }

        mapCtrl.updateMap = function() {
          if (!mapCtrl.map) {
            mapCtrl.map = new google.maps.Map(
              document.getElementById("courses-map"), {
                center: {
                  lat: 48.862725,
                  lng: 2.2875920
                },
                zoom: 16
              }
            );
          }

          mapCtrl.updateCourses().then(function() {
            var bounds = new google.maps.LatLngBounds();
            var length = $scope.courses.length;
            var marker;
            for (var i = 0; i < length; i++) {
              bounds.extend($scope.courses[i].place.geometry.location);

              marker = new google.maps.Marker({
                position: $scope.courses[i].place.geometry.location,
                title: $scope.courses[i].title
              });
              marker.setMap(mapCtrl.map);
            }
            
            mapCtrl.map.setCenter(bounds.getCenter());
            mapCtrl.map.fitBounds(bounds);
            mapCtrl.map.setZoom(mapCtrl.map.getZoom() - 1);
            if (mapCtrl.map.getZoom() > 15) {
              mapCtrl.map.setZoom(15);
            }
            
            google.maps.event.trigger(mapCtrl.map, 'resize');
          }, function(reason) {
            console.log("From updateMap: " + reason);
          });

        };

      }
    ]);
})();