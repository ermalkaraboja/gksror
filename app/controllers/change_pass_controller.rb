class ChangePassController < ApplicationController

  before_action :try_login, :set_change_pass

  def edit
    @change_pass = User.find @current_user.id
  end

  def update
    respond_to do |format|
      @change_pass = @current_user
      if @change_pass.update(change_pass_params)
        flash[:notice] = "change_pass was successfully updated."
        format.html {redirect_to '/change_pass', notice: 'change_pass was successfully updated.'}
        format.json {render :edit, status: :ok, location: @change_pass}
      else
        format.html {render :edit, danger: 'change_pass not saved!'}
        format.json {render json: @change_pass.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def set_change_pass
    @change_pass = @current_user
  end

  private
  def change_pass_params
    params.require(:change_pass).permit(:name, :surname, :email)
  end

end
