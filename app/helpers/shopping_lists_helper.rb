module ShoppingListsHelper
  def measure_in_words(measure)
    text = I18n.t("measure.#{measure.unit}", default: measure.unit)
    quantity = number_with_precision(measure.quantity, strip_insignificant_zeros: true, precisiion: 2)
    return "#{quantity}" if measure.items?
    return "#{text}" if measure.other?
    return "#{quantity} #{text}"
  end

  def quantity_with_precision(measure)
    number_with_precision(measure.quantity, strip_insignificant_zeros: true, precisiion: 2)
  end
end
