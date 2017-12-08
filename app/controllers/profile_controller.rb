class ProfileController < ApplicationController

  before_action :try_login, :set_profile

  def edit
    @profile = User.find @current_user.id
  end

  def update
    respond_to do |format|
      @profile = User.find @current_user.id
      if @profile.update(profile_params)
        flash[:notice] = "Prfiles was successfully updated."
        format.html {redirect_to '/profile/settings', notice: 'Prfiles was successfully updated.'}
        format.json {render :edit, status: :ok, location: @profile}
      else
        format.html {render :edit, danger: 'Profile not saved!'}
        format.json {render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def set_profile
    @profile = @current_user
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :surname, :email)
  end

end
