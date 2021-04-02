module UserHelper

  def output_user_errors
    if @user.errors.any?
      content_tag(:div, id: 'error_explanation') +
        content_tag(:div) + 
          content_tag(:p, pluralize(@user.errors.count,"error"))
      @user.errors.full_messages.each do |msg|
        content_tag(:ul) + 
          content_tag(:li, msg)
      end
    end
  end
end