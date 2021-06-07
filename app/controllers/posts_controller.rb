class PostsController < ApplicationController
  def index
   @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def edit

  end

  def destroy

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

  end

  private

   def post_params
    params.require(:post).permit(:title, :description)
  end
end
