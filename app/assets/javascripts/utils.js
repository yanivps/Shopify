var Utils = {
	disableSubmitOnEnter: function(form) {
		$(form).on("keypress", function (e) {
			if (e.keyCode == 13) {
				return false;
			}
		});
	},
	registerClearModalDataOnDismiss: function(modal) {
		modal.on('hidden.bs.modal', function (e) {
			$(this).find("input").not(':submit').val('').end()
			$(this).find('.has-error').removeClass('has-error')
		});
	},
	attachFancyBox: function() {
		$(".fancybox").fancybox({
			padding: 5,
			openEffect : 'none',
			closeEffect	: 'none',
			helpers : {
				title : {
					type : 'float'
				}
			}
		});
	}
}

$(document).ready(function() {
	Utils.attachFancyBox();
});