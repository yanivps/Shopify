var Utils = {
	disableSubmitOnEnter: function(form) {
		$(form).on("keypress", function (e) {
		    if (e.keyCode == 13) {
		        return false;
		    }
		});
	}
}