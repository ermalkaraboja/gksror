class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_user_from_session, :set_menu


  def set_menu
    @menu = [
        MenuItem.new('Courses', '/courses', 'fa-book'),
        MenuItem.new('Students', '#', 'fa-users'),
    ]
  end

  protected
  def try_login
    check_user_from_session
    redirect_to login_path and return if @current_user.nil?
  end

  def check_user_from_session
    @current_user ||= User.find session[:id] unless session[:id].blank?
  end


end
