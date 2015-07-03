class ShoppingListsController < ApplicationController
  def index
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
  end

  def new
  end

  def edit
  end
end
