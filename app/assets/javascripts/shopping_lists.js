var ShoppingList = {
	init: function() {
		self = this;
		var formAction = $("#product-form").attr('action')
		$('.edit-product').on('click', function(e) {
			$('.edit-mode').each(function() {
				self.enterReadOnlyMode(this)
			});

			$(this).each(function() {
				var tableRow = $(this).closest('tr')
				if (tableRow.hasClass('edit-mode')) {
					self.enterReadOnlyMode(tableRow)
				} else {
					self.enterEditMode(tableRow)
				}
			});

			e.preventDefault();
		})
		$('.update-product-submit').each(function() {
			$(this).on('click', function(e) {
				$("#product-form").attr('action', formAction + '/products/' + $(this).attr('data-product-id') )
			})
		});
		$("#products-list").find('.control-wrapper input').each(function() {
			$(this).attr('data-original-value', this.value)
		});
		$("#products-list").find('.control-wrapper select').each(function() {
			$(this).attr('data-original-value', this.value)
		});

		$("#presetsSearch input").keyup(function() {
	    	$.get($("#presetsSearch").attr("action"), $("#presetsSearch").serialize(), null, "script");
	    	return false;
  		});

		Utils.registerClearModalDataOnDismiss($('#shoppingListFormModal'));
  		Utils.disableSubmitOnEnter($("#presetsSearch"));

		enquire.register("screen and (max-width:39.9375em)", {
			match : function() {
				$("#products-list>table").removeClass("table table-condensed");
				$("#products-list>table>tbody").addClass("border-top")
			},
			unmatch : function() {
				$("#products-list>table").addClass("table table-condensed");
				$("#products-list>table>tbody").removeClass("border-top")
			}
		});
	},
	enterEditMode: function (parent) {
		$(parent).find('.control-wrapper').each(function() {
			$(this).removeClass('hide')
		});
		
		$(parent).find('.product-field').each(function() {
			$(this).addClass('hide')
		});

		$(parent).addClass('edit-mode')

		$(parent).find('.control-wrapper input').each(function() {
			$(this).attr('disabled', false)
		});
		$(parent).find('.control-wrapper select').each(function() {
			$(this).attr('disabled', false)
		});
	},
	enterReadOnlyMode: function (parent) {
		//revert original values
		$("#products-list").find('.control-wrapper input').each(function() {
			$(this).val( $(this).attr('data-original-value') )
			$(this).attr('disabled', true)
		});
		$("#products-list").find('.control-wrapper select').each(function() {
			$(this).val( $(this).attr('data-original-value') )
			$(this).attr('disabled', true)
		});

		// enter read only mode
		$(parent).find('.control-wrapper').each(function() {
			$(this).addClass('hide')
		});
		
		$(parent).find('.product-field').each(function() {
			$(this).removeClass('hide')
		});

		$(parent).removeClass('edit-mode')
	},
	validateNewShoppingListForm: function() {
		if ($("#shopping_list_title").val() == "") {
			$("#shopping_list_title").parent().addClass('has-error')
			return false;
		}
	}
}


$(document).on("ready", function() {
  ShoppingList.init();
});