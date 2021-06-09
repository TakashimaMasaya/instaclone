class PostsController < ApplicationController
  def index
   @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "回答「#{post.title}」を削除しました。"
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to posts_path, notice: "回答「#{@post.title}」を登録しました。"
    else
      render :new
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_url, notice: "回答「#{post.title}」を更新しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :images, :description)
    # params.require(:post).permit(:title,{images: []}, :description)
  end
end
