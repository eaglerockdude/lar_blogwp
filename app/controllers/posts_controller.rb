class PostsController < ApplicationController

 before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def create

    @post = Post.new(post_params)

    if @post.save
      flash[:notice]  = "Post was created successfully."
      redirect_to posts_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
    #  before action gets post
  end

  def update
    # before action gets post

    if @post.update(post_params)
      redirect_to @post, notice: "Post has been updated."
    else
      render :edit
    end
  end

  def destroy
    # before action get post
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
