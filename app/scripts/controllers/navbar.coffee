'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'NavbarCtrl', ($scope, $location) ->
    $scope.menu = [
      title: 'Home'
      link: '#/'
    ,
      title: 'UI Components'
      link: '#/ui-components'
    ,
      title: 'Ruby'
      link: '#/ruby'
    ,
      title: 'CoffeeScript'
      link: '#/coffeescript'
    ,
      title: 'Angular'
      link: '#/angular'
    ,
      title: 'Sass'
      link: '#/sass'
    ,
      title: 'Jade'
      link: '#/jade'
    ]

    $scope.isActive = (route) ->
      route is $location.path()