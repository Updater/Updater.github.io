'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'RailsCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings