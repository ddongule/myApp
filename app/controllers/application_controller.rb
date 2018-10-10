class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    ## 위에는 name parameter를 가져올 수 있게, 밑ㅌ에는 수정할 수 있게
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])

  end

  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
  end

end
