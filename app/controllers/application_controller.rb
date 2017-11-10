class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_user_from_session

  protected
  def try_login
    check_user_from_session
    redirect_to login_path and return if @current_user.nil?
  end

  def check_user_from_session
    @current_user ||= User.find session[:id]
  end

  def show
    render 'layouts/welcome'
  end
end
