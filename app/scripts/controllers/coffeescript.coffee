'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'CoffeescriptCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings