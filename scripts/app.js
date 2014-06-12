(function() {
  'use strict';
  var module;

  module = angular.module('updaterStyleGuidesApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ngRoute']);

  module.config(function($routeProvider, $locationProvider) {
    $routeProvider.when('/', {
      templateUrl: 'partials/main.html'
    }).when('/coffeescript', {
      templateUrl: 'partials/coffeescript.html'
    }).when('/sass', {
      templateUrl: 'partials/sass.html'
    }).when('/ruby', {
      templateUrl: 'partials/ruby.html'
    }).when('/angular', {
      templateUrl: 'partials/angular.html'
    }).when('/jade', {
      templateUrl: 'partials/jade.html'
    }).when('/ui-components', {
      templateUrl: 'partials/ui-components.html',
      controller: 'UiComponentsCtrl'
    }).otherwise({
      redirectTo: '/'
    });
    return $locationProvider.html5Mode(false);
  });

  module.controller('NavbarCtrl', function($scope, $location) {
    $scope.menu = [
      {
        title: 'Home',
        link: '#/'
      }, {
        title: 'UI Components',
        link: '#/ui-components'
      }, {
        title: 'Ruby',
        link: '#/ruby'
      }, {
        title: 'CoffeeScript',
        link: '#/coffeescript'
      }, {
        title: 'Angular',
        link: '#/angular'
      }, {
        title: 'Sass',
        link: '#/sass'
      }, {
        title: 'Jade',
        link: '#/jade'
      }
    ];
    return $scope.isActive = function(route) {
      return route === $location.path();
    };
  });

  module.controller('UiComponentsCtrl', function($scope) {
    $scope.blueSwatches = ['#2b7499', '#5590ad', '#80acc2', '#aac7d6', '#d5e3eb', '#f3fcff'];
    $scope.greenSwatches = ['#56b784', '#75c79b', '#92d7b2', '#b1e7c9', '#e3f4eb', '#f4fbf7'];
    $scope.redSwatches = ['#f84e57', '#f97179', '#fb959a', '#fcb8bc', '#fee8e9'];
    $scope.yellowSwatches = ['#ffe98f', '#ffefad', '#fff7db', '#fffcec', '#fffdf5'];
    return $scope.neutralSwatches = ['#404041', '#666667', '#8c8c8d', '#bababb', '#d9d9d9', '#efefef', '#f5f5f5'];
  });

}).call(this);

/*
//@ sourceMappingURL=app.js.map
*/