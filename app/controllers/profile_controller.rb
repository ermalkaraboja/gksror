class ProfileController < ApplicationController

  before_action :try_login

  def change_password
  end

  def update_password
    respond_to do |format|
      success = ->(message) {
        format.html {redirect_to '/profile/settings', notice: message}
        format.json {render message, status: :ok}
      }
      error = ->(message) {
        flash[:warning] = message
        format.html {render :change_password, warning: message}
        format.json {render json: message, status: :unprocessable_entity}
      }
      current_pass_params = password_params

      if @current_user.matches_password? current_pass_params[:old_password] && current_pass_params[:password] == current_pass_params[:confirm_password]
        @current_user.password = current_pass_params[:password]
        success.call("Password changed successfully.") unless @current_user.save
      else
        error.call("Password doesnt match, please try again.")
      end
    end
  end

  def edit
    @profile = User.find @current_user.id
  end

  def update
    respond_to do |format|
      @profile = User.find @current_user.id
      if @profile.update(profile_params)
        flash[:notice] = "Profile was successfully updated."
        format.html {redirect_to '/profile/settings', notice: 'Profile was successfully updated.'}
        format.json {render :edit, status: :ok, location: @profile}
      else
        format.html {render :edit, danger: 'Profile not saved!'}
        format.json {render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :surname, :email)
  end

  private
  def password_params
    params.require(:password).permit(:old_password, :password, :confirm_password)
  end

end
