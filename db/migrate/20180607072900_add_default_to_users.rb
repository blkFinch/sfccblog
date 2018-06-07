class AddDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :permission, :integer, default: 1
  end
end
