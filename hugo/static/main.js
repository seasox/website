function camRefresh() {
    var cam = document.getElementById('mousecam');
    var refresh = document.getElementById('refresh_enabled');
    var interval = 3000;
    setInterval(function()  { 
	if (refresh.checked) {
	    cam.src = cam.src.split("?")[0] + '?' + new Date().getTime();
	}
    }, interval);
}

document.addEventListener('DOMContentLoaded', camRefresh, false);
