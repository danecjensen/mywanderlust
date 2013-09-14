'use strict';

/* Directives */


angular.module('odyssey.directives', []).
  directive('appVersion', ['version', function(version) {
    return function(scope, elm, attrs) {
      elm.text(version);
    };
  }]).
  directive('googleplace', ['currentCity', '$location', function(currentCity, $location) {
    return {
        link: function(scope, element, attrs) {
                    var options = {
                        types: ['(cities)'],
                        componentRestrictions: {}
                    };
                    scope.gPlace = new google.maps.places.Autocomplete(element[0], options);
                    google.maps.event.addListener(scope.gPlace, 'place_changed', function() {
    		                var place = scope.gPlace.getPlace();
                            console.log(place);
    		                var current_city = {
    		                 	name: place.name,
    		                	formatted_address: place.formatted_address,
    		                	location: {
    		                		lat: place.geometry.location.pb,
    		                		lng: place.geometry.location.qb
    		                	}
    		                }
    		                currentCity.setProperty(current_city);


                        var form = document.createElement("form");
                        form.setAttribute("method", "post");
                        form.setAttribute("action", "/trips");

                        var hiddenField = document.createElement("input");
                        hiddenField.setAttribute("type", "hidden");
                        hiddenField.setAttribute("name", "trip[name]");
                        hiddenField.setAttribute("value", place.name);
                        form.appendChild(hiddenField);

                        var hiddenField = document.createElement("input");
                        hiddenField.setAttribute("type", "hidden");
                        hiddenField.setAttribute("name", "trip[current_lat]");
                        hiddenField.setAttribute("value", place.geometry.location.pb);
                        form.appendChild(hiddenField);

                        var hiddenField = document.createElement("input");
                        hiddenField.setAttribute("type", "hidden");
                        hiddenField.setAttribute("name", "trip[current_lng]");
                        hiddenField.setAttribute("value", place.geometry.location.qb);
                        form.appendChild(hiddenField);

                        var hiddenField = document.createElement("input");
                        hiddenField.setAttribute("type", "hidden");
                        hiddenField.setAttribute("name", "formatted_address");
                        hiddenField.setAttribute("value", place.formatted_address);
                        form.appendChild(hiddenField);

                        document.body.appendChild(form);
                        form.submit();

    		            });
                }

    }
}]);
