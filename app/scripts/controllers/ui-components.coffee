'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'UiComponentsCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings