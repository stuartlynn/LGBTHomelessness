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


      href =$(".directions").each(function(){
        href = $(this).attr("href")

        href = href.replace("ll", "daddr")
        href+= "&saddr="+e.latlng.lat+","+e.latlng.lng
        $(this).attr("href", href)


      });

      var myIcon = L.divIcon({className: 'user_location'});
			L.marker(e.latlng, {icon: myIcon}).addTo(map)
				.bindPopup("You are within " + radius + " meters from this point").openPopup();

			L.circle(e.latlng, radius, {color: "red"}).addTo(map);

      $(".place").each(function(){
        console.log("here")

        data = lat = $(this).data()

        if(typeof(data) != undefined && data.lat != "" && data.lng != ""){
          lat = $(this).data().lat;
          lng = $(this).data().lng;
          dist_raw = e.latlng.distanceTo( L.latLng(lat, lng))*0.000621371
          dist = Math.floor(dist_raw)
          dist_class = "purple"
          if(dist <= 2){
            dist_class = "green"
          }else if(dist <=10){
            dist_class = "blue"
          }

          $(this).append("<span class='dist badge "+dist_class+"'> aprox "+dist+" miles</span>")
          $(this).attr("data-dist", dist_raw)
        }
        else{
          $(this).attr("data-dist", 10000000)
        }
      })

      $(".place.sortable").tsort({attr:'data-dist', order: "asc"});


    });
    map.locate({setView: true, maxZoom: 13});
  }
})
