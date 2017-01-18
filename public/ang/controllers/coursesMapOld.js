(function() {

  angular.module('skilly-courses')
    .controller('CoursesMapController', ['$http', '$scope', '$q', 'googleMaps',
      function($http, $scope, $q, googleMaps) {

        /*var mapCtrl = this;
        
        // Fonction qui rafraichit la carte quand elle apparait sinon
        // elle est toute grise
        mapCtrl.showMapFn = function() {
          mapCtrl.initCoursesMap();
          if (mapCtrl.map) {
            setTimeout(function() {
              mapCtrl.updateOptions();
              google.maps.event.trigger(mapCtrl.map, 'resize');
            }, 10);
          }
          return $scope.showMap;
        };
        
        mapCtrl.updateCourses = function() {
          var length = $scope.courses.length;
          for (var i = 0; i < length; i++) {
            if (! $scope.courses[i].place) {
              googleMaps.findFromId($scope.courses[i].position)
              .then(function(result) {
                $scope.courses[i].place = result;
              }, function(reason) {
                var s = "Error retrieving a GMaps place.\n";
                s += "For id : " + $scope.courses[i].position;
                console.log(s);
              })
            }
          }
        }
        
        mapCtrl.updateMap = function() {
          var length = $scope.courses.length;
          
        }

        // Updates the map options for right display
        mapCtrl.updateOptions = function() {
          var latlngList = [];
          var length = $scope.courses.length;
          mapCtrl.updateCourses();
          for (var i = 0; i < length; i++) {
            latlngList.push(new google.maps.LatLng(
              $scope.courses[i].place.geometry.location
            ));
          }

          var bounds = new google.maps.LatLngBounds();
          for (i = 0; i < length; i++) {
            bounds.extend(latlngList[i]);
          }

          mapCtrl.map.setCenter(bounds.getCenter()); //or use custom center
          mapCtrl.map.fitBounds(bounds);

          mapCtrl.map.setZoom(mapCtrl.map.getZoom() - 1);

          // set a minimum zoom 
          // if you got only 1 marker or all markers are on the same address map will be zoomed too much.
          if (mapCtrl.map.getZoom() > 15) {
            mapCtrl.map.setZoom(15);
          }
        };


        mapCtrl.initCoursesMap = function() {
          if (!mapCtrl.map) { // Définition de la map
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
          mapCtrl.updateOptions();
          mapCtrl.markers = [];
          var length = $scope.courses.length;
          var marker;
          for (var i = 0; i < length; i++) {
            marker = new google.maps.Marker({
              position: $scope.courses[i].place.geometry.location,
              title: $scope.courses[i].title
            });
            marker.setMap(mapCtrl.map);
            mapCtrl.markers.push(marker);
          }
          google.maps.event.trigger(mapCtrl.map, 'resize');
        };
*/
      }
    ]);

})();