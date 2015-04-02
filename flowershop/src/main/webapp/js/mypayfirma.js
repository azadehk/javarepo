//Client-Side JavaScript in HTML file or similar
//var dnsname = 'http://localhost:8080/flowershop';
function callback(response) {
		console.log(response);
	};
	
	document.querySelector('#pay').onclick = function(e) {
	var doc = document;

		var card_number = doc.querySelector('input[name="cardNumber"]').value;
		var card_expiry_month = doc.querySelector('select[name="expiryMonth"]').value;
		var card_expiry_year = doc.querySelector('select[name="expiryYear"]').value;
		var cvv2 = doc.querySelector('input[id="CVV2"]').value;

		var name = doc.querySelector('input[name="name"]').value;
		var email = doc.querySelector('input[name="email"]').value;

		var key = '63cb9ea13588700390c9f89f513784e73a03abe8';
		var z = new Payfirma(key, {
			'card_number': card_number,
			'card_expiry_month': card_expiry_month,
			'card_expiry_year':  card_expiry_year,
			'cvv2': cvv2
		}, {
			'first_name': name,
			'last_name': name
		}, dnsname + 'payfirma/pay', callback);
	};