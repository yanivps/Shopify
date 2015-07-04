class ShoppingListsController < ApplicationController
  def index
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @products = @shopping_list.products
  end

  def new
  end

  def edit
  end
end
