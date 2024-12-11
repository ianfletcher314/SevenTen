class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # TODO IAN this gets devise working but breaks the twilio thing
  # before_action :authenticate_user!
  before_action do
    if current_user && current_user.email.include?("@brandnewbox.com")
      Rack::MiniProfiler.authorize_request
    end
  end

  before_action :set_sentry_context

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name, :preferred_name])
  end

  def set_sentry_context
    return unless current_user
    # Sentry.set_user(id: current_user.id, email: current_user.email)
  end
end
