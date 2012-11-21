class Forbidden < StandardError; end
class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to error_404_url
  end

  rescue_from Forbidden do
    redirect_to error_403_url
  end
end
