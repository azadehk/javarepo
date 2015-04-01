/////////////////////////////////////////
/////Target:Using a dialog box to let customer enter his/her information
/////Author: azadeh.kosari@gmail.com
/////////////////////////////////////////


$(function() {
    var dialog, form,
      emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      name = $( "#name" ),
      email = $( "#email" ),
      cardNumber = $( "#cardNumber" ),
      amount = $("#amount"),
      CVV2=$("#CVV2"),
      allFields = $( [] ).add( name ).add( email ).add( cardNumber ).add( CVV2 ).add( amount ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
    //A function to check the lenght of input textg
    function checkLength( o, n, min, max ) {
    	console.log(o);
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Length of " + n + " must be between " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
    //A function which lets us to check the input values
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
   
    //Submitting order which is last step of shopping and after that we will send information to Payfirma gateway.
    function submitOrder() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      valid = valid && checkLength( name, "name", 3, 16 );
      valid = valid && checkLength( email, "email", 6, 80 );
      valid = valid && checkLength( cardNumber, "cardNumber", 16, 16 );
      valid = valid && checkLength( amount, "amount", 1, 5 );
      valid = valid && checkLength( CVV2, "CVV2", 3, 4 );
 
      //valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
      valid = valid && checkRegexp( email, emailRegex, "eg. azadeh.kosari@gmail.com" );
      valid = valid && checkRegexp( cardNumber, /^([0-9])+$/, "Card Number only allow : 0-9" );
      valid = valid && checkRegexp( amount, /^([0-9])+$/, "Amount only allow : 0-9" );
      valid = valid && checkRegexp( CVV2, /^([0-9])+$/, "CVV2 only allow : 0-9" );
 
      if ( valid ) {
    	  // do something to complete the shopping
    	  $("#downloadButton").click();
        $( "#users tbody" ).append( "<tr>" +
          "<td>" + name.val() + "</td>" +
          "<td>" + email.val() + "</td>" +
          "<td>" + cardNumber.val() + "</td>" +
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
