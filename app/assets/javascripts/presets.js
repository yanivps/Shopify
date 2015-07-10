var Preset = {
	init: function() {
		self = this;
		
		self.registerPresetToggle();
		Utils.registerClearModalDataOnDismiss($('#presetFormModal'));
	},
	registerPresetToggle: function() {
		$('.preset-products-toggler').on('click', function(e) {
			$(this).closest('.preset').find('.preset-products').toggleClass('hide')
			var span = $(this).find('span:first-child')
			if (span.hasClass('glyphicon-minus')) {
				span.addClass('glyphicon-plus') 
				span.removeClass('glyphicon-minus') 
			} else {
				span.addClass('glyphicon-minus')
				span.removeClass('glyphicon-plus')  
			}

			return false;
		})
	},
	validateNewPresetForm: function() {
		if ($("#preset_title").val() == "") {
			$("#preset_title").parent().addClass('has-error')
			return false;
		}
	}
}


$(document).on("ready", function() {
	Preset.init();
});