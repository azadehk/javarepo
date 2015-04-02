/////////////////////////////////////////
/////Target:Using this dialog box to show progress of sending an order
/////Author: azadeh.kosari@gmail.com
/////////////////////////////////////////

var completemsg = 'The order is sent.';
var startingmsg = 'Starting download...'
$(function() {
	var progressTimer, progressbar = $("#progressbar"), progressLabel = $(".progress-label"), dialogButtons = [ {
		text : "Cancel Sending",
		click : closeDownload
	} ], dialog = $("#dialog").dialog({
		autoOpen : false,
		closeOnEscape : false,
		resizable : false,
		buttons : dialogButtons,
		open : function() {
			progressTimer = setTimeout(progress, 2000);
		},
		beforeClose : function() {
			downloadButton.button("option", {
				disabled : false,
				label : "Start Sending.."
			});
		}
	}), downloadButton = $("#downloadButton").button().on("click", function() {
		$(this).button("option", {
			disabled : true,
			label : "Sending..."
		});
		dialog.dialog("open");
});
progressbar.progressbar({
		value : false,
		change : function() {
			progressLabel.text("Current Progress: " + progressbar.progressbar("value") + "%");
		},
		complete : function() {
			progressLabel.text(completemsg);
			dialog.dialog("option", "buttons", [ {
				text : "Close",
				click : closeDownload
			} ]);
			$(".ui-dialog button").last().focus();
		}
	});
	function progress() {
		var val = progressbar.progressbar("value") || 0;
		progressbar.progressbar("value", val + Math.floor(Math.random() * 3));
		if (val <= 99) {
			progressTimer = setTimeout(progress, 50);
		}
	}
	function closeDownload() {
		clearTimeout(progressTimer);
		dialog.dialog("option", "buttons", dialogButtons).dialog("close");
		progressbar.progressbar("value", false);
		progressLabel.text(startingmsg);
		//downloadButton.focus();
	}
});