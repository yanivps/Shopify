class ShoppingLists::ProductsController < ProductsBaseController
  def create
    @new_product = super
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @products = @shopping_list.products
    
    @new_product.shopping_list = @shopping_list
    if @new_product.save
      flash[:notice] = "\"#{@new_product.title}\" נוסף לרשימה."
      redirect_to @shopping_list
    else
      flash[:error] = "חלה שגיאה בהוספת המוצר לרשימה. אנא נסה שוב."
      render "shopping_lists/show"
    end

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
