class Presets::ProductsController < ProductsControllerBase
  def create
    product = super
    preset = Preset.find(params[:preset_id])
    product.preset = preset
    if product.save
      flash[:notice] = "\"#{product.title}\" נוסף לרשימה."
    else
      flash[:error] = "חלה שגיאה בהוספת המוצר לרשימה. אנא נסה שוב."
    end

    redirect_to preset
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
