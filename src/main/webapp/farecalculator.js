// Sidebar show/hide
function showSidebar() {
    const sidebar = document.querySelector('.sidebar');
    sidebar.style.display = 'flex';
}

function hideSidebar() {
    const sidebar = document.querySelector('.sidebar');
    sidebar.style.display = 'none';
}

// Restore selected stations from localStorage
var indexsrcvalue = localStorage.getItem('sourceValue');
var indexdestvalue = localStorage.getItem('destinationValue');
var indexsrcindex = localStorage.getItem('srcindex');
var indexdestindex = localStorage.getItem('destindex');

if (indexsrcvalue != null && indexdestvalue != null) {
    document.getElementById('selectedSource').innerText = indexsrcvalue;
    document.getElementById('selectedDestination').innerText = indexdestvalue;

    document.getElementById('source').selectedIndex = indexsrcindex;
    document.getElementById('destination').selectedIndex = indexdestindex;

    let srcindex = indexsrcindex;
    let destindex = indexdestindex;
    let fareText = "0Rs";

    if (srcindex != destindex) {
        let diff = Math.abs(srcindex - destindex);
        let fare = 5 * diff;

        if (fare <= 10) {
            fareText = "10Rs";
        } else if (fare >= 35) {
            fareText = "35Rs";
        } else {
            fareText = fare + "Rs";
        }
    }

    document.getElementById('fareResult').innerText = fareText;
    setFareAmountForBooking(fareText);  // ✅ Update hidden field
}

// Fare calculation on dropdown change or button click
function calculateFare() {
    var source = document.getElementById('source');
    var destination = document.getElementById('destination');

    let srcindex = source.selectedIndex;
    let destindex = destination.selectedIndex;

    let srcvalue = source.options[srcindex].textContent;
    let destvalue = destination.options[destindex].textContent;

    document.getElementById('selectedSource').innerText = srcvalue;
    document.getElementById('selectedDestination').innerText = destvalue;

    let fareText = "0Rs";

    if (srcindex != destindex) {
        let diff = Math.abs(srcindex - destindex);
        let fare = 5 * diff;

        if (fare <= 10) {
            fareText = "10Rs";
        } else if (fare >= 35) {
            fareText = "35Rs";
        } else {
            fareText = fare + "Rs";
        }
    }

    document.getElementById('fareResult').innerText = fareText;
    setFareAmountForBooking(fareText);
}

// Set hidden input value for booking form
function setFareAmountForBooking(fare) {
    let amountField = document.getElementById("amountField");
    if (amountField) {
        let fareStr = fare.toString();
        amountField.value = fareStr.replace("Rs", "").trim();
    }
}

/* Fare chart language switch */
let english = document.getElementById('englishbutton');
english.style.backgroundColor = '#55528D';
english.style.color = 'white';
let marathi = document.getElementById('marathibutton');
marathi.style.backgroundColor = 'white';
marathi.style.color = 'black';

function englishbutton() {
    english.style.backgroundColor = '#55528D';
    english.style.color = 'white';
    marathi.style.backgroundColor = 'white';
    marathi.style.color = 'black';

    let img = document.getElementById('farechart');
    img.src = "images/fare_chart_english.jpg";
}

function marathibutton() {
    marathi.style.backgroundColor = '#55528D';
    marathi.style.color = 'white';
    english.style.backgroundColor = 'white';
    english.style.color = 'black';

    let img = document.getElementById('farechart');
    img.src = "images/fare_chart_marathi.jpg";
}
