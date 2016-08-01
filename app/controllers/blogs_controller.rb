class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.order(created_at: :desc)
    @comment = @blog.comments.new
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Blog not found"
    redirect_to root_path
  end
end
