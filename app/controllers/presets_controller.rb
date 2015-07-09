class PresetsController < ApplicationController
  def index
    @presets = Preset.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    
    if params[:shopping_list_id]
      @shopping_list = ShoppingList.find(params[:shopping_list_id])
    end
  end

  def show
    @preset = Preset.find(params[:id])
    @products = @preset.products
  end

  def create
    preset = Preset.new(preset_params)
    preset.user = current_user
    if preset.save
      redirect_to preset
    else
      flash[:error] = "חלה שגיאה ביצירת המועדף. אנא נסה שוב."
      redirect_to :back
    end
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

  private

  def preset_params
    params.require(:preset).permit(:title)
  end
end
