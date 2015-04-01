//var dnsname = 'http://second-xz56sfax89.elasticbeanstalk.com/';  
var dnsname = 'http://localhost:8080/flowershop/';
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
		  }

	});


function renderRow(jsonp){
	  var obj = JSON.parse(JSON.stringify(jsonp));
	  var dataRow = "";
	  var active = "active" ;
	  var buttonval = '<td><span aria-hidden="true" class="margin glyphicon glyphicon-remove-circle"></span>';
	  buttonval += '<span aria-hidden="true" class="margin glyphicon glyphicon-edit"></span></td>';
	  $.each(obj, function() {
		  dataRow += '<div class="item '+ active +'" >';
			dataRow += ' <img alt="First slide" src="images/'+ this['imageName'] +'" class="first-slide" style="height:600px;width:600px">';
			dataRow += ' <div class="container">';
			dataRow += '  	<div class="carousel-caption">';
			dataRow += '    	<h1>'+ this['price'] +' CAD$</h1>';
			dataRow += '    	<p>'+ this['fName'] +'</p>';
			dataRow += '    	<p><input id="opendialog'+ this['flowerId'] +'" role="button" type="button" class="btn btn-lg btn-primary" value="Place Order" onclick="javascript:showdialog('+ this['flowerId'] +')" /></p>';
			dataRow += '    </div>';
			dataRow += ' </div>';
			dataRow += '</div>';
			active = "";
	  });
	  $('#itemList').html(dataRow);

}

function showdialog(flowerId){
	  document.getElementById('txtSelectedId').value= flowerId;
	  document.getElementById('opendialog').click();
}
/////////////////////////////javascript UI


$(function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      name = $( "#name" ),
      email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( name ).add( email ).add( password ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Length of " + n + " must be between " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
   
    function submitOrder() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      valid = valid && checkLength( name, "username", 3, 16 );
      valid = valid && checkLength( email, "email", 6, 80 );
      valid = valid && checkLength( password, "password", 5, 16 );
 
      valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
      valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
      valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
 
      if ( valid ) {
        $( "#users tbody" ).append( "<tr>" +
          "<td>" + name.val() + "</td>" +
          "<td>" + email.val() + "</td>" +
          "<td>" + password.val() + "</td>" +
        "</tr>" );
        dialog.dialog( "close" );
      }
      return valid;
    }
 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 600,
      width: 500,
      modal: true,
      buttons: {
        "Submit Order": submitOrder,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      submitOrder();
    });
 
    
    $('input[id^="opendialog"]').button().on( "click", function() {
      dialog.dialog( "open" );
    });
  });

});