class SeoContentToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :seo_content, :text
  end
end
