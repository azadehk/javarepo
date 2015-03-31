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
  </head>

  <body>

    <div class="container">
      <div class=" clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="#">Home</a></li>
            <li role="presentation"><a href="#">About</a></li>
            <li role="presentation"><a href="#">Contact</a></li>
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
          	<input id="list" type="button" value="List" style="display:none"/>
        </div>
      </div>

      <footer class="footer">
        <p>&copy; Azadeh Kosari 2015</p>
      </footer>

    </div> <!-- /container -->
    <!-- Dialog -->
    <div id="dialog-form" title="Create new user">
	  <p class="validateTips">All form fields are required.</p>
	 
	  <form>
	    <fieldset>
	      <label for="name">Name</label>
	      <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
	      <label for="email">Email</label>
	      <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
	      <label for="password">Password</label>
	      <input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
	 
	      <!-- Allow form submission with keyboard without duplicating the dialog button -->
	      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
	    </fieldset>
	  </form>
	</div>
	<!-- /Dialog -->
  </body>
  
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/events.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="dist/js/holder.js"></script>
</html>