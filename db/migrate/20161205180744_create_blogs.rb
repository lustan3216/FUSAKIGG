class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :view_counts ,default: 0

      t.timestamps
    end
  end
end
