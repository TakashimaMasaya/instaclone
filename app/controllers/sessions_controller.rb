class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      render :new, notice: 'ログインしました'
    else
      render :new, notice: 'ログインに失敗しました'
    end
  end

  def destory
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
