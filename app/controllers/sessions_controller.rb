class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @user = User.new
  end

  def create
    if @user = login(user_params[:email],user_params[:password])
      redirect_to posts_path, notice: 'ログインしました'
    else
      render :new, notice: 'ログインに失敗しました'
    end
  end

  def destory
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private
  
  def user_params
     params.require(:session).permit(:id, :email, :password)
  end
end
