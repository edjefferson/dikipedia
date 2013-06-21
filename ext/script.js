myURL="about:blank"; //A default url just in case below code doesn't work
chrome.tabs.onUpdated.addListener(function(tabId,changeInfo,tab){ //onUpdated should fire when the selected tab is changed or a link is clicked 
    chrome.tabs.getSelected(null,function(tab){
        myURL=tab.url;
        if (myURL.indexOf('en.wikipedia.org/wiki/') != -1){
        	var breakurl = myURL.split("/")
        	bul = breakurl.length - 1
        	topic = breakurl[bul]
        xmlHttp = new XMLHttpRequest();
xmlHttp.open( "GET", "http://dikipedia.herokuapp.com/topic/" + encodeURIComponent(myURL), true );
xmlHttp.send();
};
    });
});