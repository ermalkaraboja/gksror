class ProfileController < ApplicationController

  before_action :try_login, :set_password

  def edit
    @profile = @current_user
  end

  def update
    respond_to do |format|
      @profile = @current_user
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
  def set_password
    @profile = @current_user
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :surname, :email)
  end

end
