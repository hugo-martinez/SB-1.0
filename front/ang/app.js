(function() {
  angular.module('skilly', ['skilly-courses', 'ngRoute', 'ngStorage']);
  angular.module('skilly').config(function($routeProvider) {
    $routeProvider
    .when('/learn', {
      templateUrl: "ang/views/landingLearn.html"
    })
    .when("/", {
      redirectTo: "/learn"
    })
    .when('/teach', {
      templateUrl: "ang/views/landingTeach.html"
    })
    .when("/askforcourse", {
      templateUrl: "ang/views/askforcourse.html"
    })
    .when("/proposeacourse", {
      templateUrl: "ang/views/proposeacourse.html"
    })
    .when("/404", {
      templateUrl: "ang/views/erreur404.html"
    })
    .when("/connexion", {
      templateUrl: "ang/views/login.html"
    })
    .when("/inscription", {
      templateUrl: "ang/views/createAccount.html"
    })
    .otherwise({
      redirectTo: "/404"
    });
  });
})();
