class AddPointToReply < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :point, :integer
  end
end
