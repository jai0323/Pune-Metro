function showSidebar(){
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display = 'flex'
}
function hideSidebar()
{
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display = 'none'
}    



function redirectToFareCalculatorPage() {
    var sourceElement = document.getElementById('source');
    var destinationElement = document.getElementById('destination');

    var sourceIndex = sourceElement.selectedIndex;
    var destinationIndex = destinationElement.selectedIndex;

    var sourceValue = sourceElement.value;
    var destinationValue = destinationElement.value;

    var sourceValue1 = sourceElement.options[sourceElement.selectedIndex];
    var sourceValue = sourceValue1.textContent;

    var destinationValue1 = destinationElement.options[destinationElement.selectedIndex];
    var destinationValue = destinationValue1.textContent;
    


    localStorage.setItem('sourceValue',sourceValue);
    localStorage.setItem('destinationValue',destinationValue);
    localStorage.setItem('srcindex',sourceIndex);
    localStorage.setItem('destindex',destinationIndex);
    if(sourceIndex!=0&&destinationIndex!=0)
    {

        window.location.href = 'farecalculator.jsp';
    }
    else
    {
        alert('please select source and destination');
    }
}

function hideLoadingScreen() {
    document.getElementById('loading-screen').style.display = 'none';
    document.getElementById('content').style.display = 'block';
}

function hideLoadingAfterDelay() {
    setTimeout(function() {
        hideLoadingScreen();
    }, 2000);
}

window.addEventListener('load', function() {
    var loadTime = performance.now();
    if (loadTime >= 2000) {
        hideLoadingScreen();
    } else {
        hideLoadingAfterDelay();
    }
});

// js for the map


var map;
var stations = [
    { name: "Garware College", lat: 18.5117, lng: 73.8391 }, // Garware College
    { name: "Pune Station", lat: 18.527455, lng: 73.873068 }, // Pune Station
   // { name: "Pune  Manpa", lat:18.5233, lng: 73.8539 }, // Pune Manpa
    { name: "Deccan", lat:18.5165, lng: 73.8366 }, // Deccan

    

    // Add latitude and longitude for other stations here
];

// Initialize and add the map
function initMap() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var userLocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            map = new google.maps.Map(
                document.getElementById("map"), {
                    zoom: 17.56,
                    center: userLocation, // Set user's location as default center
                });

            // Add a marker for the user's location
            var userMarker = new google.maps.Marker({
                position: userLocation,
                map: map,
                title: 'Your Location'
            });
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

// Function to find nearest station to user
function findNearestStation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var userLocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            var nearestStation = findNearestStationToUser(userLocation);
            if (nearestStation) {
                // Move map to show source and destination
                var bounds = new google.maps.LatLngBounds();
                bounds.extend(new google.maps.LatLng(userLocation.lat, userLocation.lng));
                bounds.extend(new google.maps.LatLng(nearestStation.lat, nearestStation.lng));
                map.fitBounds(bounds);

                // Add a marker for the nearest station
                var stationMarker = new google.maps.Marker({
                    position: nearestStation,
                    map: map,
                    title: nearestStation.name
                });
            }
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

// Function to find nearest station to user
function findNearestStationToUser(userLocation) {
    var shortestDistance = Number.MAX_VALUE;
    var nearestStation = null;

    stations.forEach(function (station) {
        var distance = calculateDistance(userLocation, station);
        if (distance < shortestDistance) {
            shortestDistance = distance;
            nearestStation = station;
        }
    });

    return nearestStation;
}

// Function to calculate distance between two points (in meters)
function calculateDistance(point1, point2) {
    var lat1 = point1.lat;
    var lon1 = point1.lng;
    var lat2 = point2.lat;
    var lon2 = point2.lng;

    var R = 6371; // Radius of the Earth in kilometers
    var dLat = (lat2 - lat1) * Math.PI / 180;
    var dLon = (lon2 - lon1) * Math.PI / 180;
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // Distance in kilometers
    return d * 1000; // Distance in meters
}