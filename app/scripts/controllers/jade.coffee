'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'JadeCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings