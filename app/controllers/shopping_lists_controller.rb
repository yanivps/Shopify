class ShoppingListsController < ApplicationController  
  def index
    @shopping_lists = ShoppingList.un_bought.paginate(page: params[:page], per_page: 8)
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @products = @shopping_list.products
    @presets = Preset.paginate(page: params[:page], per_page: 5)
    @new_product = Product.new
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
    else
      flash[:fail] = "חלה שגיאה במחיקת הרשימה. אנא נסה שוב."
    end
    if shopping_list.was_bought?
      redirect_to history_shopping_lists_path
    else
      redirect_to shopping_lists_path
    end
  end

  def history
    @bought_shopping_lists = ShoppingList.bought.paginate(page: params[:page], per_page: 8)
  end

  def bought
    set_bought true
  end

  def un_bought
    set_bought false
  end

  def buy
    @shopping_list = ShoppingList.find(params[:id])
  end

  def buy_complete
    shopping_list = ShoppingList.find(params[:id])

    product_ids = params.keys.select { |key| key.start_with? "was_bought_cb_p_" }.map { |key| key.sub "was_bought_cb_p_", "" }
    flash[:alert] = "לא סומן אף מוצר כנקנה"
    if product_ids.empty?
      redirect_to :back 
      return
    end
    
    products = Product.find(product_ids)
    bought_shopping_list = ShoppingList.create(
      title: Time.now.strftime("%d/%m/%Y %H:%M"), 
      user: shopping_list.user, 
      was_bought: true, 
      created_at: shopping_list.created_at, 
      buyer: current_user)

    ActiveRecord::Base.transaction do
      products.each do |product|
        if !product.update_attributes(shopping_list: bought_shopping_list)
          bought_shopping_list.destroy
          flash[:error] = "הפעולה נכשלה."
          redirect_to buy_shopping_list_path
          return
        end
      end
    end

    shopping_list.destroy if shopping_list.products.count == 0

    flash[:notice] = "תודה שקנית עם Shopify!"
    redirect_to root_path
  end

  private

  def set_bought(status)
    shopping_list = ShoppingList.find(params[:id])
    if status
      shopping_list.buyer = current_user
    end
    shopping_list.was_bought = status
    
    if !shopping_list.save
      flash[:fail] = "חלה שגיאה. אנא נסה שוב."
    end
    redirect_to :back
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:title, :image)
  end
end
