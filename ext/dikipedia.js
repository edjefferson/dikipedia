function sendget(){

xmlHttp = new XMLHttpRequest();
xmlHttp.open( "GET", "http://dikipedia.herokuapp.com/topic/iron", false );
xmlHttp.send( null );};