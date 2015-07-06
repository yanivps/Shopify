class ProductsController < ApplicationController
  def create
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    product = Product.new(product_params)
    product.user = current_user
    product.shopping_list = @shopping_list
    product.measure = Measure.new(unit: params[:unit].to_i, quantity: params[:quantity])
    if product.save
      redirect_to @shopping_list
    else
      redirect_to root_path
      # render ""
    end
  end

  def update
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    product = Product.find(params[:id])
    product.attributes = product_params
    product.measure = Measure.new(unit: params[:unit].to_i, quantity: params[:quantity])
    if product.save
      flash[:notice] = "\"#{product.title}\" עודכן בהצלחה."
    else
      flash[:error] = "חלה שגיאה בעדכון הפריט. אנא נסה שוב"
    end

    redirect_to shopping_list
  end

  def destroy
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    product = Product.find(params[:id])

    if product.destroy
      flash[:notice] = "\"#{product.title}\" הוסר מהרשימה."
    else
      flash[:error] = "חלה שגיאה בהסרת הפריט. אנא נסה שוב"
    end
    
    redirect_to shopping_list
  end

  private

  def product_params
    params.require(:product).permit(:title, :description)
  end

end
