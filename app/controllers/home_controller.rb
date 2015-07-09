class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @shopping_lists = ShoppingList.all
  end
end
