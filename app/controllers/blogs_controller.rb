class BlogsController < ApplicationController
  def show
    @blog = Blog.find(1)
  end
end
