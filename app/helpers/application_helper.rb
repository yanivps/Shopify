module ApplicationHelper
  
  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
  end

  def form_has_error_class(errors)
    if errors.any?
      "form-group has-error"
    else
      "form-group"
    end
  end
  
end
