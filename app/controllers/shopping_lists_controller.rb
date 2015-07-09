class ShoppingListsController < ApplicationController  
  def index
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @products = @shopping_list.products
    @presets = Preset.paginate(page: params[:page], per_page: 5)
  end

  def new
  end

  def edit
  end
end
