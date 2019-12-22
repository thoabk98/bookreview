class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post, only: %w[show]

  def new
    @post = Post.new
  end

  def index
    if params[:category_id]
      @category = Category.find params[:category_id]
      @posts = @category.posts
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong ..."
    end
    redirect_to posts_path
  end

  def show
    @comment = Comment.new
    @likes = @post.likes.includes(:user)
    @is_liked = @post.is_liked(current_user)
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :title, :category_id, :user_id, :cover)
  end
end
