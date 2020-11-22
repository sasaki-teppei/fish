class AddUserIdToDone < ActiveRecord::Migration[5.2]
  def change
    add_column :dones, :user_id, :integer
  end
end
