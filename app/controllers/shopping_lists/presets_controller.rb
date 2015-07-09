class ShoppingLists::PresetsController < ApplicationController
  def index
    @presets = Preset.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
  end

  def add_to_list
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    preset = Preset.find(params[:id])
    
    success = false
    ActiveRecord::Base.transaction do  
      preset.products.each do |product|
        new_product = Product.new(product.attributes.except("id", "preset_id", "created_at", "updated_at"))
        new_product.user = current_user
        new_product.measure = Measure.new(unit: product.measure.unit, quantity: product.measure.quantity)
        new_product.shopping_list = shopping_list
        success = new_product.save
      end
    end

    if success
      flash[:notice] = "מועדף \"#{preset.title}\" נוסף לרשימה."
    else
      flash[:error] = "הוספת המועדף \"#{preset.title}\" לרשימה נכשלה. אנא נסה שוב."
    end
    
    redirect_to shopping_list
  end

end
