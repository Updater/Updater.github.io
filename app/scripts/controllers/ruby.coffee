'use strict'

angular.module('updaterStyleGuidesApp')
.controller 'RubyCtrl', ($scope, $http) ->
  $http.get('/api/awesomeThings').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings