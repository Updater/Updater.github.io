'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'SlimCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings