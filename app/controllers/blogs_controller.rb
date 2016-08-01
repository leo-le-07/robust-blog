class BlogsController < ApplicationController
  def index
    top_num = 10
    @top_commented_blogs = top_commented(top_num)
    @top_recent_blogs = top_recent(top_num)
  end

  def new
    @user = User.find(params[:user_id])
    @blog = @user.blogs.new
  end

  def create
    @user = User.find(params[:user_id])
    @blog = @user.blogs.new(blog_params)
    if @blog.save
      flash[:success] = "Create new blog successfully"
      redirect_to root_path
    else
      flash.now[:notice] = @blog.errors.full_messages.to_sentence
      render 'new'
    end
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

    def top_commented(top_num)
      Blog.all.select("blogs.*, COUNT(1) as comment_count").joins("JOIN comments as comments ON comments.blog_id = blogs.id").group("id").order("comment_count DESC").limit(top_num)

    end

    def top_recent(top_num)
      Blog.order(created_at: :desc).limit(top_num)
    end
end
