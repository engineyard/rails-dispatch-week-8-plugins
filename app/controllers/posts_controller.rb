class PostsController < ApplicationController  
  respond_to :atom, :only => :index
  before_filter :authenticate_author!, :except => [:index, :show]

  def index
    @posts = Post.order("created_at desc").includes(:author)
    respond_with @posts
  end

  def show
    @post = Post.find_by_id(params[:id])
    respond_with @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_author.posts.build(params[:post])
    @post.save
    respond_with(@post)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params[:post])
    respond_with(@post)
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    respond_with(@post)
  end
end
