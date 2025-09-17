const sidebar = document.querySelector('.sidebar')
function showSidebar(){
    sidebar.style.display = 'flex'
}
function hideSidebar()
{
    
    sidebar.style.display = 'none'
}  

const showicon = document.getElementById('showicon');

document.addEventListener('click',e=>{
    if(!sidebar.contains(e.target)&&(e.target !== showicon &&!showicon.contains(e.target)))
    {
       sidebar.style.display='none'
    }
   
})


//js for these service button
var cnt = 1;
const services = document.querySelector(".services");
const arowdown = document.getElementById('arowdown');
const arowup = document.getElementById('arowup');
arowup.style.display='none';
services.style.display='none';




const servicesid = document.getElementById('servicesid');

// Add event listener for mouseenter on servicesid
servicesid.addEventListener('mouseenter', function() {
    cnt = 1;
    services.style.display = 'flex';
    arowdown.style.display = 'none';
    arowup.style.display = 'inline';
});

// Add event listener for mouseleave on servicesid
servicesid.addEventListener('mouseleave', function(e) {
    if (!services.contains(e.relatedTarget)) {
        services.style.display = 'none';
        arowdown.style.display = 'inline';
        arowup.style.display = 'none';
        cnt = 1;
    }
});

// Add event listener for mouseleave on services
services.addEventListener('mouseleave', function(e) {
    if (!servicesid.contains(e.relatedTarget)) {
        services.style.display = 'none';
        arowdown.style.display = 'inline';
        arowup.style.display = 'none';
        cnt = 1;
    }
});


var secondcnt = 0;
const servicesidebar = document.getElementById('servicesidebar');
const servicessidebarlist = document.getElementById('serviceslist');
const arowdownsidebar = document.getElementById('arowdownsidebar');
const arowupsidebar = document.getElementById('arowupsidebar');
arowupsidebar.style.display='none';
servicessidebarlist.style.display='none';

servicesidebar.addEventListener('click',function( ){

    if(secondcnt==1)
   {
    servicessidebarlist.style.display='none';
    arowdownsidebar.style.display='inline';
    arowupsidebar.style.display='none';
   
    secondcnt=0;
   }
   else{
    servicessidebarlist.style.display='flex';
    arowdown.style.display='none';
    arowup.style.display='inline';
    secondcnt=1;
   }
})

// cssfor font size button

const increaseCssBtn = document.getElementById('increaseCssBtn');
const defaultCssBtn = document.getElementById('defaultCssBtn');
const decreaseCssBtn = document.getElementById('decreaseCssBtn');

if (increaseCssBtn && defaultCssBtn && decreaseCssBtn) {
    increaseCssBtn.addEventListener('click', function() {
        changeCssFile('maxsizestyle.css');
        const cssLink = document.getElementById('cssLink');
        cssLink.setAttribute('href', 'maxsizestyle.css');


        console.log("increase button is clicked");
    });

    defaultCssBtn.addEventListener('click', function() {
        changeCssFile('styles.css');
        console.log("default button is clicked");

    });

    decreaseCssBtn.addEventListener('click', function() {
        changeCssFile('minsizestyle.css');
        console.log("decrease button is clicked");

    });
} else {
    console.error('One or more buttons not found.');
}


function changeCssFile(cssFileName) {
    console.log("in the function changeCssFile");
    const cssLink = document.getElementById('cssLink');
    if (cssLink) {
        console.log("cssling found")
        cssLink.setAttribute('href', cssFileName);
        console.log("file is changed");
    } else {
        console.error('CSS link element not found.');
    }
}

// function changeCssFile(cssFileName) {
//     // Get the <link> element that links to the CSS file
//     const cssLink = document.getElementById('cssLink');
//     // Change the href attribute to link to the new CSS file
//     cssLink.setAttribute('href', cssFileName);
// }



// js for language
 
const language = document.getElementById('languagebtn');
const languagearrowup = document.getElementById('languagearrowup');
const languagearrowdown = document.getElementById('languagearrowdown')








const languagecontainer = document.getElementById('languagecontainer');
var languagecnt = 1;

languagecontainer.style.display='none';
// Add event listener for mouseenter on servicesid
language.addEventListener('mouseenter', function() {
    cnt = 1;
    languagecontainer.style.display = 'flex';
    
});

// Add event listener for mouseleave on servicesid
language.addEventListener('mouseleave', function(e) {
    if (!services.contains(e.relatedTarget)) {
        languagecontainer.style.display = 'none';
       
        languagecnt = 1;
    }
});

// Add event listener for mouseleave on services
languagecontainer.addEventListener('mouseleave', function(e) {
    if (!languagecontainer.contains(e.relatedTarget)) {
        languagecontainer.style.display = 'none';
               languagecnt = 1;
    }
});
