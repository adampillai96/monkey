class AddUserToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :user_id, :string
  end
end