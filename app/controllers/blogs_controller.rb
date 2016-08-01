class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
  end

  def create
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    flash[:success] = "Update success"
    redirect_to user_blog_path(@blog.user, @blog)
  end

  def edit
    @user = User.find(params[:user_id])
    @blog = @user.blogs.where("id = ?", params[:id]).first
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.order(created_at: :desc)
    @comment = @blog.comments.new
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Blog not found"
    redirect_to root_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
