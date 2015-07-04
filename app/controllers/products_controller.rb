class ProductsController < ApplicationController
  def create
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    product = Product.new(product_params)
    product.user = User.all.sample # Change to current_user
    product.shopping_list = @shopping_list
    product.measure = Measure.new(unit: params[:unit].to_i, quantity: params[:quantity])
    if product.save
      redirect_to shopping_list_path(@shopping_list)
    else
      redirect_to root_path
      # render ""
    end
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:title, :description)
  end

end
