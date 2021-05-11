class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


 #ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_name, :gender, :age])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys:[:trainer_name, :gender])
    end
  end

end
