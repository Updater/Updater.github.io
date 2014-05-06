'use strict'

angular.module('updaterStyleGuidesApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'MainCtrl'
      
      .when '/coffeescript',
        templateUrl: 'partials/coffeescript'
        controller: 'CoffeescriptCtrl'
      .when '/sass',
        templateUrl: 'partials/sass'
        controller: 'SassCtrl'
      .when '/ruby',
        templateUrl: 'partials/ruby'
        controller: 'RubyCtrl'
      .when '/rails',
        templateUrl: 'partials/rails'
        controller: 'RailsCtrl'
      .when '/angular',
        templateUrl: 'partials/angular'
        controller: 'AngularCtrl'
      .when '/slim',
        templateUrl: 'partials/slim'
        controller: 'SlimCtrl'
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true