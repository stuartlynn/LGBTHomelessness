// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require leaflet


$(document).ready(function(){
  if($("#map").length > 0){
    map.on('locationfound', function(e){
      var radius = e.accuracy / 2;

    var myIcon = L.divIcon({className: 'user_location'});
			L.marker(e.latlng, {icon: myIcon}).addTo(map)
				.bindPopup("You are within " + radius + " meters from this point").openPopup();

			L.circle(e.latlng, radius, {color: "red"}).addTo(map);

    });
    map.locate({setView: true, maxZoom: 16});
  }
})
