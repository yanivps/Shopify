class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @shopping_lists = ShoppingList.un_bought.paginate(page: params[:page], per_page: 8)
  end
end
