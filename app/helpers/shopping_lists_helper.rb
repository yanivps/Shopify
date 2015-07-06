module ShoppingListsHelper
  def measure_in_words(measure)
    text = I18n.t("measure.#{measure.unit}", default: measure.unit)
    quantity = number_with_precision(measure.quantity, strip_insignificant_zeros: true, precisiion: 2)
    return "#{quantity} #{text}"
  end
end
