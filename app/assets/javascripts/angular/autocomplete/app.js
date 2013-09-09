'use strict';


// Declare app level module which depends on filters, and services
angular.module('odyssey', ['odyssey.services', 'odyssey.controllers', 'ui.bootstrap', 'odyssey.filters', 'odyssey.directives', 'ngCookies', 'google-maps', 'angular-flash.service', 'angular-flash.flash-alert-directive']);
  // config(['$routeProvider', function($routeProvider) {
  //   $routeProvider.when('/', {templateUrl: 'partials/partial2.html', controller: 'HomeCtrl'});
  //   $routeProvider.when('/b', {templateUrl: 'partials/partial1.html', controller: 'SearchCtrl'});
  //   $routeProvider.otherwise({redirectTo: '/view1'});
  // }]);
