'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'AngularCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings