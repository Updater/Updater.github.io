'use strict'

angular.module('updaterStyleGuidesApp')
  .controller 'NavbarCtrl', ($scope, $location) ->
    $scope.menu = [
      title: 'Home'
      link: '/'
    ,
      title: 'UI Components'
      link: '/ui-components'
    ,
      title: 'Ruby'
      link: '/ruby'
    ,
      title: 'Rails'
      link: '/rails'
    ,
      title: 'CoffeeScript'
      link: '/coffeescript'
    ,
      title: 'Angular'
      link: '/angular'
    ,
      title: 'Sass'
      link: '/sass'
    ,
      title: 'Slim'
      link: '/slim'
    ]

    $scope.isActive = (route) ->
      route is $location.path()