var dnsname = 'http://second-xz56sfax89.elasticbeanstalk.com/';  
//var dnsname = 'http://localhost:8080/flowershop/';
$(document).ready(function() {
	$("#create").click(function(){
		$.ajax({
	        url: dnsname + "flower/create",
	        method:'POST',
	        contentType: 'application/json',
	        data:JSON.stringify({
	        	flowerId:2,
	        	price:45,
	        	fName:"Rose 12",
	        	imageName: "MIMG12.jpg",
	        	description:"Rose Flower Bouquet.",
	        	isAvailable:true
	        }),
	        dataType: 'json'
	    }).then(function(data) {
	    	$('#contactId').html(data.message);
	    });
	});

	
	$(function(){
		$.ajax({
	        url: dnsname + "flower/list",
	        method:'GET',
	        contentType: 'application/json',
	        dataType: 'json',
	        error: function(x){
	        		alert(x);
	        		}
	    }).then(function(data) {
	    	 renderRow(data);
	    	//console.log(data)
	       
	    });
		
		function onclickdynamic(id){
			console.log('onclickdynamic');
			  dialog.dialog( "open" );
			  getAFlower();
		  }
	});
	$("#about").click(function(){
		$( "#aboutDialog" ).dialog();
	});
	
	$("#orderManagment").click(function(){
		$( "#orderManagmentDialog" ).dialog();
	});
	
});

	

