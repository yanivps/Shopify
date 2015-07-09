class PresetsController < ApplicationController
  def index
    @presets = Preset.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @preset = Preset.find(params[:id])
    @products = @preset.products
  end

  def create
    preset = Preset.new(preset_params)
    preset.user = current_user
    if preset.save
      redirect_to preset
    else
      flash[:error] = "חלה שגיאה ביצירת המועדף. אנא נסה שוב."
      redirect_to :back
    end
  end

  private

  def preset_params
    params.require(:preset).permit(:title)
  end
end
