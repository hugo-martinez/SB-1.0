(function() {
  angular.module('skilly')
    .factory('googleMaps', ['$http', '$q', function($http, $q) {
      //Source : http://stackoverflow.com/questions/38521809/factory-method-always-return-undefined-in-angularjs
      var gm = {};
      gm.geocoder = new google.maps.Geocoder();

      // googleMaps.findFromAddress()
      // Argument : address(string)
      // Réponse : GeocoderResult si OK
      //           { "error" : status } si non OK
      gm.findFromAddress = function(address) {
        var deffered = $q.defer();
        gm.geocoder.geocode({
            "address": address
          },
          function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              deffered.resolve(results);
            } else {
              deffered.reject(status);
            }
          });
        return deffered.promise;
      };

      // googleMaps.findFromId()
      // Argument : placeId(string)
      // Réponse : GeocoderResult si OK
      //           { "error" : status } si non OK
      gm.findFromId = function(placeId) {
        var deffered = $q.defer();
        gm.geocoder.geocode({
          "placeId": placeId
        }, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            var result = results[0];
            deffered.resolve(result);
          } else {
            deffered.reject(status);
          }
        });
        return deffered.promise;
      };

      return gm;
    }]);
})();