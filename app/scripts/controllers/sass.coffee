'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'SassCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings