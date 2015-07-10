class ShoppingListsController < ApplicationController  
  def index
    @shopping_lists = ShoppingList.paginate(page: params[:page], per_page: 10)
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @products = @shopping_list.products
    @presets = Preset.paginate(page: params[:page], per_page: 5)
    @new_product = Product.new
  end

  def new
  end

  def edit
  end
end
