(function() {
  angular.module('skilly')
    .controller('DashboardController', [
      '$scope',
      function($scope) {
        var self = this;

        new Morris.Donut({
          element: "studTeach-chart",
          colors: [
            "#339999",
            "#ff6666"
          ],
          data: [
            {label: "Cours suivis", value: 6},
            {label: "Cours donnés", value: 8}
          ]
        });

      }
    ]);
})();
