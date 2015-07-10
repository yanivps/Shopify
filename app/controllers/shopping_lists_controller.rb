class ShoppingListsController < ApplicationController  
  def index
    @shopping_lists = ShoppingList.paginate(page: params[:page], per_page: 8)
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

  def create
    shopping_list = ShoppingList.new(shopping_list_params)
    shopping_list.user = current_user
    if shopping_list.save
      redirect_to shopping_list
    else
      flash[:error] = "חלה שגיאה ביצירת הרשימה. אנא נסה שוב."
      redirect_to :back
    end
  end

  def update
    shopping_list = ShoppingList.find(params[:id])
    if shopping_list.update_attributes(shopping_list_params)
      redirect_to shopping_list
    else
      flash[:error] = "חלה שגיאה בעדכון הרשימה. אנא נסה שוב."
      redirect_to :back
    end
  end

  def destroy
    shopping_list = ShoppingList.find(params[:id])
    if shopping_list.destroy
      flash[:notice] = "הרשימה \"#{shopping_list.title}\" נמחקה."
      redirect_to root_path
    else
      flash[:fail] = "חלה שגיאה במחיקת הרשימה. אנא נסה שוב."
      redirect_to :back
    end
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:title)
  end
end
