class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    authorize!(@post.creator)
  end

  def update
    authorize!(@post.creator)
    if @post.update(post_params)
      redirect_to post_url, notice: 'post was updated.'
    else
      render 'edit'
    end
  end

  def destroy
    authorize!(@post.creator)
    @post.destroy
    redirect_to posts_url, notice: 'post was successfully deleted.'
  end

  private
  def set_post
    @post = find_and_ensure_entry(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image, :creator_id)
  end
end
