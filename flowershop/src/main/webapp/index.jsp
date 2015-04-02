<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>Flower Shop</title>
    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/jumbotron-narrow.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css "/>
	<script src="js/functions.js"></script>
  </head>

  <body>
	<div >
		<input type="hidden" id="txtSelectedId" value="0" />
	</div>
    <div class="container">
      <div class=" clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="#">Home</a></li>
            <li role="presentation"><a href="#" id="about">About</a></li>
            <li role="presentation"><a href="#" id="orderManagment" >Order Managment</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Flower Shop</h3>
      </div>

      <div class="jumbotron" style="padding:20px !important">
	        <div data-ride="carousel" class="carousel slide" id="myCarousel">
		      <!-- Indicators -->
		      <ol class="carousel-indicators">
		        <li class="" data-slide-to="0" data-target="#myCarousel"></li>
		        <li data-slide-to="1" data-target="#myCarousel" class="active"></li>
		        <li data-slide-to="2" data-target="#myCarousel" class=""></li>
		      </ol>
		      
		      <div role="listbox" class="carousel-inner" id="itemList">
		        
		        
		      </div>
		      <a data-slide="prev" role="button" href="#myCarousel" class="left carousel-control">
		        <span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a data-slide="next" role="button" href="#myCarousel" class="right carousel-control">
		        <span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span>
		        <span class="sr-only">Next</span>
		      </a>
		    </div>
   		</div>

      <div class="row marketing">
        <div class="col-lg-6">
          	<input id="create" type="button" value="Create" style="display:none"/>
        </div>

        <div class="col-lg-6">
          	<input id="opendialog" type="button" value="opendialog" style="display:none"/>
        </div>
        
        <div class="col-lg-6">
          	<input id="pay" type="button" value="pay" style="display:none"/>
        </div>
      </div>

      <footer class="footer">
        <p>&copy; Azadeh Kosari 2015</p>
      </footer>

    </div> <!-- /container -->
    <!-- Dialog Form -->
    <div id="dialog-form" title="Enter Card Information">
	  <p class="validateTips">All form fields are required.</p>
	 
	  <form>
	    	<table cellpadding="100">
	    		<tr>
	    			<td><label for="name">Name</label></td>
	    			<td><input type="text" name="name" id="name" value="" class="text ui-widget-content ui-corner-all largetextbox"></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4"><div style="padding:3px"></div></td>
	    		</tr>
	    		<tr>
	    			<td><label for="email">Email</label></td>
	    			<td><input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all largetextbox"></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4"><div style="padding:3px"></div></td>
	    		</tr>
	    		<tr>
	    			<td><label for="cardNumber">CardNumber</label></td>
	    			<td><input type="text" name="cardNumber" id="cardNumber" value="0" class="text ui-widget-content ui-corner-all largetextbox"></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4"><div style="padding:3px"></div></td>
	    		</tr>
	    		<tr>
	    			<td><label for="amount">Amount</label></td>
	    			<td><input type="text" name="amount" id="amount" value="0" class="text ui-widget-content ui-corner-all "></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4"><div style="padding:3px"></div></td>
	    		</tr>
	    		<tr>
	    			<td><label for="expiryMonth">ExpiryDate</label></td>
	    			<td>
	    				<select id="expiryMonth" name="expiryMonth">
	    					<option value="1">Jan</option>
	    					<option value="2">Feb</option>
	    					<option value="3">Mar</option>
	    					<option value="4">Apr</option>
	    					<option value="5">May</option>
	    					<option value="6">Jun</option>
	    					<option value="7">Jul</option>
	    					<option value="8">Aug</option>
	    					<option value="9">Sep</option>
	    					<option value="10">Oct</option>
	    					<option value="11">Nov</option>
	    					<option value="12">Dec</option>
	    				</select>
	    				<select id="expiryYear" name="expiryYear">
	    					<option value="2015">2015</option>
	    					<option value="2016">2016</option>
	    					<option value="2017">2017</option>
	    					<option value="2018">2018</option>
	    					<option value="2019">2019</option>
	    					<option value="2020">2020</option>
	    				</select>
	    			</td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4"><div style="padding:3px"></div></td>
	    		</tr>
	    		<tr>
	    			<td><label for="CVV2">CVV2</label></td>
	    			<td><input type="password" name="CVV2" id="CVV2" value="" class="text ui-widget-content ui-corner-all "></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4"><div><br></div></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4"><div id="selecteddescription" ></div></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="center"><img id="selectedimage" style="width:150px;height:200px"></img></td>
	    		</tr>
	    	</table>
	  </form>
	</div>
	<!-- /Dialog Form -->
	
	<!-- Progress Dialog  -->
		<div id="dialog" title="Order Processing">
		<div class="progress-label">Starting Sending...</div>
		<div id="progressbar"></div>
		</div>
		<button id="downloadButton" style="display:none">sending Email</button>
	<!-- /Progress Dialog  -->
	
	<!-- Dialog About-->
		<div id="aboutDialog" title="About Developer" style="display:none">
			<p>This sample is created that I show my level of knowledge and abilities. If you have any question please feel free to contact me. <a href="mailto:azadeh.kosari@gmail.com">azadeh.kosari@gmail.com</a></p>
		</div>
	<!-- /Dialog About-->
	
	<!-- Order Managment-->
		<div id="orderManagmentDialog" title="Order Managment/History" style="display:none">
			<p>Under Construction..</p>
		</div>
	<!-- /Dialog About-->
	
  </body>
  
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/payfirma.minified.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/events.js"></script>
    <script type= "text/javascript" src="${pageContext.request.contextPath}/js/dialog.js"></script>
    <script type= "text/javascript" src="${pageContext.request.contextPath}/js/progressbar.js"></script>
    <script type= "text/javascript" src="${pageContext.request.contextPath}/js/mypayfirma.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="dist/js/holder.js"></script>
</html>
