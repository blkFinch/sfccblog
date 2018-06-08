class AddIndexToArticles < ActiveRecord::Migration[5.2]
  def change
    add_index :articles, :created_at
  end
end
