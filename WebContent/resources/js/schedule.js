/**
 * timer.jsp remain-time
 */
function diffDay(){
	const today = new Date();
	const targetT = [];
	const diff = [];	
	const diffDay = [];
	const diffHour = [];
	const diffMin = [];
	const diffSec = [];
	let remain = "";
	
	for(var i=0; i<selen; i++){
		console.log("i"+i);
		targetT[i] = new Date(selend[i]);
		diff[i] = targetT[i] - today;
		diffDay[i] = Math.floor(diff[i]/(1000*60*60*24));
		diffHour[i] = Math.floor((diff[i]/(1000*60*60)) % 24);
		diffMin[i] = Math.floor((diff[i]/(1000*60)) % 60);
		diffSec[i] = Math.floor(diff[i] / 1000 % 60);
		
		remain = "D-"+diffDay[i]+"  "+diffHour[i]+":"+diffMin[i]+":"+diffSec[i];
		
		document.querySelector("#remain-time"+i).innerHTML=remain;
		console.log("remain: "+remain);
	}
};

window.onload = function() {
	diffDay();
	setInterval(diffDay, 500);
};