class ProductsControllerBase < ApplicationController
  def create
    product = Product.new(product_params)
    product.user = current_user
    product.measure = Measure.new(unit: params[:unit].to_i, quantity: params[:quantity])
    return product
  end

  def update
    product = Product.find(params[:id])
    product.attributes = product_params
    product.measure = Measure.new(unit: params[:unit].to_i, quantity: params[:quantity])
    if product.save
      flash[:notice] = "\"#{product.title}\" עודכן בהצלחה."
    else
      flash[:error] = "חלה שגיאה בעדכון הפריט. אנא נסה שוב"
    end
  end

  def destroy
    product = Product.find(params[:id])

    if product.destroy
      flash[:notice] = "\"#{product.title}\" הוסר מהרשימה."
    else
      flash[:error] = "חלה שגיאה בהסרת הפריט. אנא נסה שוב"
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description)
  end

end
