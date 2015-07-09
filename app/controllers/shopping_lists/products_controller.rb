class ShoppingLists::ProductsController < ProductsControllerBase
  def create
    product = super
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    product.shopping_list = shopping_list
    if product.save
      flash[:notice] = "\"#{product.title}\" נוסף לרשימה."
    else
      flash[:error] = "חלה שגיאה בהוספת המוצר לרשימה. אנא נסה שוב."
    end

    redirect_to shopping_list
  end

  def update
    super
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    redirect_to shopping_list
  end

  def destroy
    super
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    redirect_to shopping_list
  end

end
