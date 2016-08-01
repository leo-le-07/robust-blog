class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Add new comment successfully"
      redirect_to blog_path(@blog)
    else
      flash[:notice] = @comment.errors.full_messages.to_sentence
      redirect_to blog_path(@blog)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
