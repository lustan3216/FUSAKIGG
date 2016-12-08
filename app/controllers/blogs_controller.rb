class BlogsController < ApplicationController
  def show
    @blog = Blog.all.first
    @view_counts = @blog.increment!(:view_counts).view_counts
  end
end
