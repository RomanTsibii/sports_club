class UsersController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => "User deleted"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Saved..."
      redirect_to users_path
    else
      flash[:alert] = "Cannot Update..."
      render edit_user_path
    end
  end



  def trainer
    @trainers = User.trainer
  end


  # rescue_from NoMethodError do |errors|
  #   redirect_to root_path, alert: errors.message
  # end
  def user_params
    params.require(:user).permit(:role )
  end
end
