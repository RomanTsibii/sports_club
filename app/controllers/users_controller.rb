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
    authorize @user
    @user.destroy
    redirect_to users_path, :notice => "User deleted"
  end

  def update
    @user = current_user
    authorize @user
    if @user.role == "admin" # Коли адмін змінює роль чи інші дані користувача
      @admin = User.find(params[:id])
        if @admin.update(admin_params)
          flash[:notice] = "Saved..."
          redirect_to users_path
        else
          flash[:alert] = "Cannot Update..."
          render edit_user_path
        end
    else # Коли звичайний користувач змінює свої дані
      if @user.update(current_user_params)
        flash[:notice] = "Saved..."
        redirect_to user_path(@user)
      else
        flash[:alert] = "Cannot Update..."
        render edit_user_path
      end
    end
  end

  def trainers
    @trainers = User.trainers
  end


  # rescue_from NoMethodError do |errors|
  #   redirect_to root_path, alert: errors.message
  # end
  def admin_params
    params.require(:user).permit(:role, :weight, :height, :from, :about, :sex )
  end

  def current_user_params
    params.require(:user).permit(:weight, :height, :from, :about, :sex )
  end

end
