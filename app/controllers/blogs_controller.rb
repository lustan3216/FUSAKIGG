class BlogsController < ApplicationController
  def show
    @blog = Blog.all.first
    @view_counts = @blog.increment!(:view_counts).view_counts
    prepare_meta_tags title: @blog.title,description: @blog.seo_content
  end
end

