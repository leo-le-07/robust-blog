class MyBlogsController < ApplicationController
  def index
    @blogs = current_user.blogs.order(created_at: :desc)
  end
end
