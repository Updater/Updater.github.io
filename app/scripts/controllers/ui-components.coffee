'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'UiComponentsCtrl', ($scope, $http) ->
    $scope.blueSwatches = [
    	{color: '2b7499'},
    	{color: '5590ad'},
    	{color: '80acc2'},
    	{color: 'aac7d6'},
    	{color: 'd5e3eb'},
    	{color: 'f3fcff'}
    ]
    $scope.greenSwatches = [
    	{color: '56b784'},
    	{color: '75c79b'},
    	{color: '92d7b2'},
    	{color: 'b1e7c9'},
    	{color: 'e3f4eb'},
    	{color: 'f4fbf7'}
    ]
    $scope.redSwatches = [
    	{color: 'f84e57'},
    	{color: 'f97179'},
    	{color: 'fb959a'},
    	{color: 'fcb8bc'},
    	{color: 'fee8e9'}
    ]
    $scope.yellowSwatches = [
    	{color: 'ffe98f'},
    	{color: 'ffefad'},
    	{color: 'fff7db'},
    	{color: 'fffcec'},
    	{color: 'fffdf5'}
    ]
    $scope.neutralSwatches = [
    	{color: '404041'},
    	{color: '666667'},
    	{color: '8c8c8d'},
    	{color: 'bababb'},
    	{color: 'd9d9d9'},
    	{color: 'efefef'},
    	{color: 'f5f5f5'}
    ]