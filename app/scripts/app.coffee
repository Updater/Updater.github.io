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
      .when '/coffeescript',
        templateUrl: 'partials/coffeescript'
      .when '/sass',
        templateUrl: 'partials/sass'
      .when '/ruby',
        templateUrl: 'partials/ruby'
      .when '/angular',
        templateUrl: 'partials/angular'
      .when '/jade',
        templateUrl: 'partials/jade'
      .when '/ui-components',
        templateUrl: 'partials/ui-components'
        controller: 'UiComponentsCtrl'
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true