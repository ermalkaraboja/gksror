class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_user_from_session, :set_menu

  def set_menu
    # TODO retrieve menu from DB (Enhacement)
    menuList = [
        MenuItem.new('Courses', '/courses', 'fa-book'),
        MenuItem.new('Students', '/students', 'fa fa-graduation-cap', ['Instructor']),
    ]
    @menu = []
    validate_menu menuList, @menu, @current_user.nil? ? [] : @current_user.role.description
    @menu
  end

  protected
  def try_login(message = '')
    check_user_from_session
    if @current_user.nil?
      flash[:warning] = message unless message.blank?
      redirect_to login_path
    end

  end

  private
  def check_user_from_session
    @current_user ||= User.find session[:id] unless session[:id].blank?
  end

  private
  def validate_menu(menu, validMenus, roles)
    roles = Array.wrap roles
    menu.each_with_index {|menuItem, index|
      if ((menuItem.roles - roles).empty?)
        validMenus.push MenuItem.new(menuItem.description, menuItem.path, menuItem.icon)
      end

      unless menuItem.children.empty?
        validate_menu menuItem.children, validMenus[index].children, roles
      end
    }
  end

  private
  def validate_rights(roles)
    try_login('You should try to login to indentify yourself!')
    roles = roles.kind_of?(Array) ? roles.select {|x| x.to_s} : Array.wrap(roles.to_s)
    unless (@current_user.nil? || (Array.wrap(@current_user.role.description) & Array.wrap(roles)).any?)
      flash[:danger] = 'You are not allowd to do this operations! Please try to sign in with a different username.'
      redirect_to root_path
    end
  end

end

