class AddBuyerIdToReply < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :buyer_id, :integer
  end
end
