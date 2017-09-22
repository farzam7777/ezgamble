module ApplicationHelper
  # def resource_name
  #   :user
  # end
 
  # def resource
  #   @resource ||= User.new
  # end

  # def resource_class
  #   User
  # end
 
  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end
  
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  
  # def user_signed_in?
  #   session[:user_id].present?
  # end
  def bootstrap_class_for(flash_type)
   case flash_type.to_sym
     when :success
       "alert-success"
     when :error
       "alert-danger"
     when :alert
       "alert-danger"
     when :notice
       "alert-success"
     when :warning
       "alert-warning"
     else
       flash_type.to_s
   end
 end
end
