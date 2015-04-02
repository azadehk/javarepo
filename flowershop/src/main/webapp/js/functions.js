//Regular Function which may use in other methods. But load at the head of Html

//This method show dialog and then call click function of a button on JSP and then call API to fetch data for a flower 
function showdialog(flowerId){
	  document.getElementById('txtSelectedId').value= flowerId;
	  document.getElementById('opendialog').click();
	  getAFlower();
}

//Calling the REST Controller to get data for a flower
function getAFlower(){
	$.ajax({
        url: dnsname + "flower/" + document.getElementById('txtSelectedId').value,
        method:'GET',
        contentType: 'application/json',
        dataType: 'json',
        error: function(x){
        		alert(x);
        		}
    }).then(function(data) {
    	 updatePanel(data);
    	 console.log('A Flower is fetched')
       
    });
}

//After fetching data for a Flower we must show image and description in dialog form 
function updatePanel(data){
	var image = document.getElementById("selectedimage")
	$(image).attr("src","images/"+ data.imageName);
	$("#amount").val(data.price);
	$("#selecteddescription").html(data.description);
}

//Rendering the body of slider
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

