class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_filter :try_login

  protected
  def try_login
    check_user_from_session
    #redirect_to login_path and return if @user.nil?
  end

  def check_user_from_session
    #@user ||= Entity.find_by_identifier session[:identifier]
  end

  def show
    render 'layouts/welcome'
  end
end
