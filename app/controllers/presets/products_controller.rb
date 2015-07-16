class Presets::ProductsController < ProductsBaseController
  def create
    @new_product = super
    @preset = Preset.find(params[:preset_id])
    @products = @preset.products

    @new_product.preset = @preset
    if @new_product.save
      flash[:notice] = "\"#{@new_product.title}\" נוסף לרשימה."
      redirect_to @preset
    else
      flash[:error] = "חלה שגיאה בהוספת המוצר לרשימה. אנא נסה שוב."
      render "presets/show"
    end
  end

  def update
    super
    preset = Preset.find(params[:preset_id])
    redirect_to preset
  end

  def destroy
    super
    preset = Preset.find(params[:preset_id])
    redirect_to preset
  end

end
