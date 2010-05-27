class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate, :except => [:index, :show]

private

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      user == "admin" && pass == "sekrit"
    end
  end

end
