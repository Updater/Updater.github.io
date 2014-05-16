'use strict'

angular.module('updaterStyleGuidesApp')
.controller 'UiComponentsCtrl', ($scope) ->
  $scope.blueSwatches = [
    '#2b7499'
    '#5590ad'
    '#80acc2'
    '#aac7d6'
    '#d5e3eb'
    '#f3fcff'
  ]
  $scope.greenSwatches = [
    '#56b784'
    '#75c79b'
    '#92d7b2'
    '#b1e7c9'
    '#e3f4eb'
    '#f4fbf7'
  ]
  $scope.redSwatches = [
    '#f84e57'
    '#f97179'
    '#fb959a'
    '#fcb8bc'
    '#fee8e9'
  ]
  $scope.yellowSwatches = [
    '#ffe98f'
    '#ffefad'
    '#fff7db'
    '#fffcec'
    '#fffdf5'
  ]
  $scope.neutralSwatches = [
    '#404041'
    '#666667'
    '#8c8c8d'
    '#bababb'
    '#d9d9d9'
    '#efefef'
    '#f5f5f5'
  ]