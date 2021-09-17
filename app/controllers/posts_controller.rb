class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  def index
    # @posts = Post.all.includes(:user).page(params[:page])
    @posts = if current_user
                current_user.feed.includes(:user).page(params[:page])
             else
                Post.all.includes(:user).page(params[:page])
             end
    @users = User.recent(5)
  end
  

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
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
       redirect_to posts_path
    else
      render :edit
    end
  end

  def search
    @posts = @search_form.search.includes(:user).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:description, images: [])
  end
end
