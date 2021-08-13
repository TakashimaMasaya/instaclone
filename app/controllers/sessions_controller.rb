# class SessionsController < ApplicationController
#   before_action :check_logged_in, only: %i[new create]
#   def new
#   end

#   def create
#     @user = login(params[:email], params[:password])

#     if @user
#       redirect_back_or_to posts_path, success: 'ログインしました'
#     else
#       flash.now[:danger] = 'ログインに失敗しました'
#       render :new
#     end
#   end

#   def destroy
#     logout
#     redirect_to root_path, success: 'ログアウトしました'
#   end

#   private

#   def check_logged_in
#     redirect_to posts_path if current_user.present?
#   end
# end
class SessionsController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create]

  def index
    @user = User.new
  end

  def create
    if @user = login(params[:email],params[:password])
      redirect_to posts_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private
  
  # def user_params
  #    params.require(:session).permit(:id, :email, :password)
  # end
end