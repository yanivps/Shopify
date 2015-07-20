var Buy = {
	init: function() {
		self = this;

		self.registerWasBoughtCheckBox();
		self.saveLoadBuyModeSettings();
		self.registerToggleAllProducts();
	},
	registerWasBoughtCheckBox: function() {
		$('.was_bought_checkbox').change(function(event) {
			if ($(this).prop('checked')) {
				$(this).closest('tr').addClass('product-bought')
			} else{
				$(this).closest('tr').removeClass('product-bought')
			}
		})
	},
	registerToggleAllProducts: function() {
		$("#toggleAllProducts").change(function(event) {
			$('.was_bought_checkbox').prop('checked', $(this).prop('checked')).change();
		});
	},
	saveLoadBuyModeSettings: function() {
		$(window).unload(saveSettings);
		loadSettings();

		function loadSettings() {
			if (localStorage.boughtProductIds) {
				$.each(localStorage.boughtProductIds.split(';'), function(index, value) {
					$('#' + value).click();
				});
			}
		}

		function saveSettings() {
			localStorage.boughtProductIds = "";
			$('.was_bought_checkbox').each(function() {
				if ($(this).prop('checked')) {
					localStorage.boughtProductIds += $(this).attr('id') + ";";
				}
			});
		}
	}
}

$(document).on("ready", function() {
	Buy.init();
});