class SessionsController < ApplicationController



  def new

  end

  def login
    form_email = params[:user][:email]
    form_pass = params[:user][:password]
    us = User.find_by_email(form_email)
    if us && us.matches_password?(form_pass)
      session[:id] = us.id
      redirect_to courses_path
    else
      flash[:warning] = "Please try again: (#{form_email}), (#{form_pass}), #{us.inspect}"
      render 'new'
    end
  end

  def logout
    session.delete(:id)
    redirect_to login_path
  end

end
