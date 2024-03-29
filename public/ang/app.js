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
    .when("/publishdemand", {
      templateUrl: "ang/views/publishdemand.html"
    })
    .when("/courseposted", {
      templateUrl: "ang/views/courseposted.html"
    })
    .when("/demandposted", {
      templateUrl: "ang/views/demandposted.html"
    })
    .when("/publishcourse", {
      templateUrl: "ang/views/publishcourse.html"
    })
    .when("/404", {
      templateUrl: "ang/views/erreur404.html"
    })
    .when("/needlogin", {
      templateUrl: "ang/views/errorNotLoggedIn.html"
    })
    .when("/connexion", {
      templateUrl: "ang/views/login.html"
    })
    .when("/inscription", {
      templateUrl: "ang/views/createAccount.html"
    })
    // Users pages
    .when("/account/dashboard", {
      templateUrl: "ang/views/account/dashboard.html"
    })
    .when("/account/notifications", {
      templateUrl: "ang/views/account/notifications.html"
    })
    .when("/account/messages", {
      templateUrl: "ang/views/account/messages.html"
    })
    .when("/account/stats", {
      templateUrl: "ang/views/account/stats.html"
    })
    .when("/account/settings", {
      templateUrl: "ang/views/account/settings.html"
    })
    .when("/500", {
      templateUrl: "ang/views/internalError.html"
    })
    .otherwise({
      redirectTo: "/404"
    });
  });
})();
