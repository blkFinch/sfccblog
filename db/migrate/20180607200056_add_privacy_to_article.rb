class AddPrivacyToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :private, :bool, :default => false
  end
end
