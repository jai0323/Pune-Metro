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

        window.location.href = 'farecalculator.html';
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

    // Event listener to call hideLoadingScreen function when the page is loaded
    window.addEventListener('load', function() {
    // Calculate load time
    var loadTime = performance.now();
    setTimeout(function() {
        hideLoadingScreen();
    }, 2000 - loadTime); // Adjust 2000 (2 seconds) according to your preference
    });
