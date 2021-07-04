class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  def index
   @posts = Post.all.includes(:user).page(params[:page]).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to posts_url, notice: "回答を削除しました。"
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save!
      redirect_to posts_path, notice: "回答を登録しました。"
    else
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
       edirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, images: [])
  end
end
