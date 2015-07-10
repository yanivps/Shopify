module ApplicationHelper
  def form_has_error_class(errors)
    if errors.any?
      "form-group has-error"
    else
      "form-group"
    end
  end
  
end
