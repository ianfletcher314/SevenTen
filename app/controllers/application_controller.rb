class ApplicationController < ActionController::Base
  before_action do
    if current_user && current_user.email.include?("@brandnewbox.com")
      Rack::MiniProfiler.authorize_request
    end
  end

  before_action :set_sentry_context


  private

  def set_sentry_context
    return unless current_user
    Sentry.set_user(id: current_user.id, email: current_user.email)
  end

end
