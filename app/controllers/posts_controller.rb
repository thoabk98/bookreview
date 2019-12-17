class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post, only: %w[show]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    
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
  end

  private
  
  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :title, :category_id, :user_id)
  end
end
