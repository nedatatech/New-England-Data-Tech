class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  BRAND_NAME = 'New England Data Tech'.freeze

  def meta_title(title)
    [title, BRAND_NAME].reject(&:empty?).join(' | ')
  end

  helper_method :logged_in?

  private

  def require_login
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
