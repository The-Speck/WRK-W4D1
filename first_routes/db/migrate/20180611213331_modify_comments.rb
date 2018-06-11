class ModifyComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :user_id, :integer, null: false
    change_column :comments, :artwork_id, :integer, null: false
    change_column :comments, :body, :text, null: false
  end
end
