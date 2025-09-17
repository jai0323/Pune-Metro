function showSidebar(){
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display = 'flex'
}
function hideSidebar()
{
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display = 'none'
}  

var indexsrcvalue = localStorage.getItem('sourceValue');
var indexdestvalue = localStorage.getItem('destinationValue');
var indexsrcindex = localStorage.getItem('srcindex');
var indexdestindex = localStorage.getItem('destindex');

if(indexsrcvalue!=null&&indexdestvalue!=null)
{

    document.getElementById('selectedSource').innerText=indexsrcvalue;
    document.getElementById('selectedDestination').innerText=indexdestvalue;

    let srcindex = indexsrcindex;
    let destindex= indexdestindex;
    if(srcindex==destindex)
    {
        document.getElementById('fareResult').innerText='0';
    }
    else
    {
        let srcindex = indexsrcindex;
        let destindex= indexdestindex;
        let diff = Math.abs(srcindex-destindex);
        let fare = 5*diff;

        if(fare<=10)
        {
            document.getElementById('fareResult').innerText='10Rs';  
        }
        else if (fare>=35) {
            document.getElementById('fareResult').innerText='35Rs';  

        } else {
            document.getElementById('fareResult').innerText=fare+'Rs';  

        }

    }
}

    

//these is for basic farecalculator
function calculateFare()
{
    var source = document.getElementById('source');
    var destination = document.getElementById('destination');

    let srcindex = source.selectedIndex;
    let destindex = destination.selectedIndex;

    var srcoption = source.options[source.selectedIndex];
    var srcvalue = srcoption.textContent;

    var destoption = destination.options[destination.selectedIndex];
    var destvalue = destoption.textContent;

    document.getElementById('selectedSource').innerText=srcvalue;
    document.getElementById('selectedDestination').innerText=destvalue;

    if(srcindex==destindex)
    {
        document.getElementById('fareResult').innerText='0';
    }
    else
    {
        let diff = Math.abs(srcindex-destindex);
        let fare = 5*diff;

        if(fare<=10)
        {
            document.getElementById('fareResult').innerText='10Rs';  
        }
        else if (fare>=35) {
            document.getElementById('fareResult').innerText='35Rs';  

        } else {
            document.getElementById('fareResult').innerText=fare+'Rs';  

        }

    }
}
/*for the fare image*/
english = document.getElementById('englishbutton');
english.style.backgroundColor = '#55528D';
english.style.color ='white';
marathi = document.getElementById('marathibutton');
marathi.style.backgroundColor='white';

var img = document.getElementById('fareimg');
function englishbutton() {
    let english = document.getElementById('englishbutton');
    let marathi = document.getElementById('marathibutton');
    let img = document.getElementById('farechart');

    english.style.backgroundColor = '#55528D';
    english.style.color = 'white';
    marathi.style.backgroundColor = 'white';
    marathi.style.color = 'black';

    img.src = "images/fare_chart_english.jpg"; 
}

function marathibutton() {
    let english = document.getElementById('englishbutton');
    let marathi = document.getElementById('marathibutton');
    let img = document.getElementById('farechart');

    marathi.style.backgroundColor = '#55528D';
    marathi.style.color = 'white';
    english.style.backgroundColor = 'white';
    english.style.color = 'black';

    img.src = "images/fare_chart_marathi.jpg";
}
