class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  def create
    # render json: params[:post]
    # @post = Post.new
    # @post.title = params[:post][:title]
    # @post.content = params[:post][:content]
    # @post = Post.new(title: params[:post][:title],
    #                  content: params[:post][:content])
    @post = Post.new(params[:post].permit(:title, :content))

    if @post.save
      redirect_to posts_path
    end
  end
  def show; end
  def edit; end
  def update

    if @post.update(post_params)
      redirect_to posts_path
    end
  end
  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :content)
  end

end