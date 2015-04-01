//Regular Function which may use in other methods. But load at the head of Html

function showdialog(flowerId){
	  document.getElementById('txtSelectedId').value= flowerId;
	  document.getElementById('opendialog').click();
  }