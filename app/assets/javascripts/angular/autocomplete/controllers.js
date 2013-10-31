'use strict';

/* Controllers */

angular.module('odyssey.controllers', []).
  controller('SearchCtrl', function($scope, $http, $location, $cookieStore, $cookies, foursquareResource, foursqResource, Trip, Destination, currentCity, flash) {
  	
    Array.prototype.chunk = function(chunkSize) {
      var array=this;
      return [].concat.apply([],
          array.map(function(elem,i) {
              return i%chunkSize ? [] : [array.slice(i,i+chunkSize)];
          })
      );
    }

    delete $http.defaults.headers.common["X-Requested-With"];
  	$scope.destinations = gon.destinations;
    $scope.explories = [];
    $scope.trip_owner = gon.trip_owner;
    $scope.username = gon.current_username;
    $scope.userphoto = gon.current_userphoto;
    $scope.trip_id = gon.trip.id;
    $scope.current_city = gon.trip.name;
    $scope.current_lat = gon.trip.current_lat;
    $scope.current_lng = gon.trip.current_lng;
    $scope.isCollapsed = true;
    $scope.isLoading = false;

    angular.extend($scope, {
      center: {
        latitude: gon.trip.current_lat, // initial map center latitude
        longitude: gon.trip.current_lng, // initial map center longitude
      }, // an array of markers,
      zoom: 11, // the zoom level
    });

    $scope.explore = function(){
      var exploreRes = foursqResource.get({'aspect': 'explore', 'll': $scope.current_lat + ',' + $scope.current_lng, 'venuePhotos': 1 }, 
        function(){
          $scope.explories = exploreRes.response.groups[0].items;
          $scope.explories = $scope.explories.chunk(1);
          return $scope.explories
      });
    }

    $scope.addDestination = function(venue){
      var photo_url = venue.photos.groups[0].items[0].prefix + '200x200' + venue.photos.groups[0].items[0].suffix;
      var l = {
        'trip_id': $scope.trip_id, 
        'name': venue.name, 
        'photo_url': photo_url, 
        'latitude': venue.location.lat, 
        'longitude': venue.location.lng,
        'fsq_prefix_url': venue.photos.groups[0].items[0].prefix,
        'fsq_suffix_url': venue.photos.groups[0].items[0].suffix,
        'added_by': $scope.username,
        'added_by_photo_url': $scope.userphoto,
        'directions': daddr.split(' ').join('+'),
        'url': '',
      };
      var d = angular.extend(l, venue.location);
      new Destination(d).create();
      $scope.destinations.unshift(d);
      //$scope.markers.push({latitude: venue.location.lat, longitude: venue.location.lng});
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
        'radius': 50000
      }



      var url = opts.url 
        + "query=" + $scope.placeQuery
        + "&ll=" + opts.ll 
        + "&v=" + opts.v 
        + "&limit=" + opts.limit
        + "&client_id=" + opts.client_id
        + "&client_secret=" + opts.client_secret
        + "&radius=" + opts.radius;

      

      $http({method: 'GET', url: url}).
        success(function(data, status, headers, config) {
          $scope.suggestions = [];
          var a = data.response.minivenues;
          for(var i = 0; i < a.length; i++){
            a[i].nameaddress = a[i].name + " (" + a[i].location.address + " " + a[i].location.city + ", " + a[i].location.state + ")";
          }
          $scope.suggestions = a;
        }).
        error(function(data, status, headers, config) {});

      return $scope.suggestions;
    }

    $scope.onSelect = function($item, $model, $label){
      var l = $model.location;
      var daddr = l.address+"+"+l.city+"+"+l.state;
      var d = angular.extend({
        'trip_id': $scope.trip_id, 
        'name': $model.name, 
        'photo_url': '',
        'latitude': $model.location.lat,
        'longitude': $model.location.lng,
        'fsq_prefix_url': '',
        'fsq_suffix_url': '',
        'added_by': $scope.username,
        'added_by_photo_url': $scope.userphoto,
        'url': '',
        //'comment':'',
        //'comment_avatar_url':'',
        'directions': daddr.split(' ').join('+'),
        }, $model.location);

      $scope.destinations.unshift(d);

      var venue = foursquareResource.get({'venueId': $model.id}, function(){
      	var photo_url = venue.response.venue.photos.groups[0].items[0].prefix + "200x200" + venue.response.venue.photos.groups[0].items[0].suffix;
      	$scope.destinations[0].photo_url = photo_url;
        $scope.destinations[0].fsq_prefix_url = venue.response.venue.photos.groups[0].items[0].prefix;
        $scope.destinations[0].fsq_suffix_url = venue.response.venue.photos.groups[0].items[0].suffix;
        $scope.destinations[0].url = venue.response.venue.url;
        new Destination($scope.destinations[0]).create();
      });      
      $scope.placeQuery = "";
      //$scope.markers.push({latitude: $model.data.location.lat, longitude: $model.data.location.lng});
    }

    $scope.submit = function(){
      var data = {
        'email': $scope.email,
        'url': $location.absUrl()
      }

      $http.post("/trips/share", data);
      $scope.email = "";
      flash.success = "Email sent!"
    }

    // $scope.addComment = function(dest){
    //   dest.comment = $scope.comment;
    //   dest.comment_avatar_url = $scope.userphoto;
    //   $scope.comment = "";
    //   alert(dest.id);

    // }


  })
  .controller('HomeCtrl', function($scope, $http) {
  	  $scope.gPlace;
	    $scope.current_city;
  });