class ShoppingListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @products = @shopping_list.products
    @presets = Preset.all
  end

  def new
  end

  def edit
  end
end
