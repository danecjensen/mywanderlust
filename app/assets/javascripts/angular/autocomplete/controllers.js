'use strict';

/* Controllers */

angular.module('odyssey.controllers', []).
  controller('SearchCtrl', function($scope, $http, $cookieStore, $cookies, foursquareResource, foursqResource, Trip, Destination, currentCity) {
  	delete $http.defaults.headers.common["X-Requested-With"];
  	$scope.destinations = gon.destinations;
    $scope.explories = [];
    $scope.trip_id = gon.trip.id;
    $scope.current_city = gon.trip.name;
    $scope.current_lat = gon.trip.current_lat;
    $scope.current_lng = gon.trip.current_lng;


    $scope.explore = function(){
      console.log("called!");
      var exploreRes = foursqResource.get({'aspect': 'explore', 'll': $scope.current_lat + ',' + $scope.current_lng, 'venuePhotos': 1 }, 
        function(){
          $scope.explories = exploreRes.response.groups[0].items;
          console.log(exploreRes);
          console.log($scope.explories);
          return $scope.explories
      });
    }

    $scope.getSuggestions = function(){

      var opts = {
        'url' : 'https://api.foursquare.com/v2/venues/suggestCompletion?',
        'client_id'     : 'AAUXORIZZ1CNKYBDNXUINODGQT24W2XO3IQAFIZ04Y0YBWVQ',
        'client_secret' : 'L0KWGXINDGXNCHLBPQKDBVY4QPARCWZLTSKJPBMV11ICADCX',
        'll' : $scope.current_lat + ',' + $scope.current_lng, 
        //'ll' : '40.7,-74.0',
        'limit' : 10,
        'v' : '20130715',
      }



      var url = opts.url 
        + "query=" + $scope.placeQuery
        + "&ll=" + opts.ll 
        + "&v=" + opts.v 
        + "&limit=" + opts.limit
        + "&client_id=" + opts.client_id
        + "&client_secret=" + opts.client_secret;

      

      $http({method: 'GET', url: url}).
        success(function(data, status, headers, config) {
          $scope.suggestions = [];
          $scope.suggestions = data.response.minivenues;
        }).
        error(function(data, status, headers, config) {});

      return $scope.suggestions;
    }

    $scope.onSelect = function($item, $model, $label){
      var d = angular.extend({'trip_id': $scope.trip_id, 'name': $model.name, 'photo_url': ''}, $model.location);
      $scope.destinations.unshift(d);
      var photo = foursquareResource.get({'venueId': $model.id}, function(){
      	var photo_url = photo.response.photos.items[0].prefix + "300x200" + photo.response.photos.items[0].suffix;
      	$scope.destinations[0].photo_url = photo_url;
        new Destination($scope.destinations[0]).create();
      });
      
      //$scope.markers.push({latitude: $model.data.location.lat, longitude: $model.data.location.lng});
    }
  })
  .controller('HomeCtrl', function($scope, $http) {
  	  $scope.gPlace;
	  $scope.current_city;
  });