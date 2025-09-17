// 🚇 Metro Graph Representation
const metroGraph = {
  // Purple Line (PCMC ↔ Swargate)
  "PCMC Bhavan": ["Sant Tukaram Nagar"],
  "Sant Tukaram Nagar": ["PCMC Bhavan", "Bhosari"],
  "Bhosari": ["Sant Tukaram Nagar", "Kasarwadi"],
  "Kasarwadi": ["Bhosari", "Phugewadi"],
  "Phugewadi": ["Kasarwadi", "Dapodi"],
  "Dapodi": ["Phugewadi", "Bopodi"],
  "Bopodi": ["Dapodi", "Khadki"],
  "Khadki": ["Bopodi", "Range Hills"],
  "Range Hills": ["Khadki", "Shivaji Nagar"],
  "Shivaji Nagar": ["Range Hills", "Civil Court"],
  "Civil Court": ["Shivaji Nagar", "Kasba Peth", "PMC"], // interchange
  "Kasba Peth": ["Civil Court", "Mandai"],
  "Mandai": ["Kasba Peth", "Swargate"],
  "Swargate": ["Mandai"],

  // Aqua Line (Vanaz ↔ Ramwadi)
  "Vanaz": ["Anand Nagar"],
  "Anand Nagar": ["Vanaz", "Ideal Colony"],
  "Ideal Colony": ["Anand Nagar", "Nal Stop"],
  "Nal Stop": ["Ideal Colony", "Garware College"],
  "Garware College": ["Nal Stop", "Deccan Gymkhana"],
  "Deccan Gymkhana": ["Garware College", "Chhatrapati Sambhaji Udyan"],
  "Chhatrapati Sambhaji Udyan": ["Deccan Gymkhana", "PMC"],
  "PMC": ["Chhatrapati Sambhaji Udyan", "Civil Court"],
  "Mangalwar Peth": ["Civil Court", "Pune Railway Station"],
  "Pune Railway Station": ["Mangalwar Peth", "Ruby Hall Clinic"],
  "Ruby Hall Clinic": ["Pune Railway Station", "Bund Garden"],
  "Bund Garden": ["Ruby Hall Clinic", "Yerawada"],
  "Yerawada": ["Bund Garden", "Kalyani Nagar"],
  "Kalyani Nagar": ["Yerawada", "Ramwadi"],
  "Ramwadi": ["Kalyani Nagar"]
};

// Coordinates for each station
const stationCoords = {
  "PCMC Bhavan": [18.6298, 73.7997],
  "Sant Tukaram Nagar": [18.6352, 73.8202],
  "Bhosari": [18.6393, 73.8401],
  "Kasarwadi": [18.6222, 73.8443],
  "Phugewadi": [18.6065, 73.8534],
  "Dapodi": [18.5933, 73.8612],
  "Bopodi": [18.5805, 73.8667],
  "Khadki": [18.5675, 73.8650],
  "Range Hills": [18.5530, 73.8560],
  "Shivaji Nagar": [18.5308, 73.8474],
  "Civil Court": [18.5285, 73.8582],
  "Kasba Peth": [18.5191, 73.8618],
  "Mandai": [18.5126, 73.8560],
  "Swargate": [18.5010, 73.8630],
  "Vanaz": [18.5084, 73.8077],
  "Anand Nagar": [18.5071, 73.8170],
  "Ideal Colony": [18.5078, 73.8244],
  "Nal Stop": [18.5090, 73.8290],
  "Garware College": [18.5160, 73.8351],
  "Deccan Gymkhana": [18.5169, 73.8414],
  "Chhatrapati Sambhaji Udyan": [18.5203, 73.8429],
  "PMC": [18.5204, 73.8567],
  "Mangalwar Peth": [18.5245, 73.8689],
  "Pune Railway Station": [18.5284, 73.8746],
  "Ruby Hall Clinic": [18.5370, 73.8834],
  "Bund Garden": [18.5405, 73.8899],
  "Yerawada": [18.5480, 73.9025],
  "Kalyani Nagar": [18.5515, 73.9145],
  "Ramwadi": [18.5570, 73.9235]
};

// Populate dropdowns
window.onload = function () {
  const stations = Object.keys(stationCoords);
  const sourceSelect = document.getElementById("source");
  const destSelect = document.getElementById("destination");

  stations.forEach(st => {
    let opt1 = new Option(st, st);
    let opt2 = new Option(st, st);
    sourceSelect.add(opt1);
    destSelect.add(opt2);
  });
};

// AO* simplified for pathfinding
function aoStar(start, goal) {
  let frontier = [[start]];
  let visited = new Set();

  while (frontier.length > 0) {
    let path = frontier.shift();
    let node = path[path.length - 1];

    if (node === goal) return path;
    if (!visited.has(node)) {
      visited.add(node);
      let neighbors = metroGraph[node] || [];
      for (let next of neighbors) {
        let newPath = [...path, next];
        frontier.push(newPath);
      }
    }
  }
  return null;
}

// Leaflet map
const map = L.map('map').setView([18.52, 73.85], 12);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '© OpenStreetMap contributors'
}).addTo(map);

let polylineLayer = null;

function findRoute() {
  const start = document.getElementById("source").value;
  const end = document.getElementById("destination").value;

  if (start === end) {
    document.getElementById("result").innerHTML = "You are already at " + start;
    return;
  }

  const route = aoStar(start, end);
  if (route) {
    document.getElementById("result").innerHTML = "<b>Route:</b> " + route.join(" ➝ ");

    if (polylineLayer) map.removeLayer(polylineLayer);

    const latlngs = route.map(st => stationCoords[st]).filter(Boolean);

    polylineLayer = L.polyline(latlngs, { color: 'blue', weight: 5 }).addTo(map);

    latlngs.forEach((coord, i) => {
      L.marker(coord).addTo(map).bindPopup(route[i]);
    });

    map.fitBounds(polylineLayer.getBounds());
  } else {
    document.getElementById("result").innerHTML = "No route found!";
  }
}
/**
 * 
 */