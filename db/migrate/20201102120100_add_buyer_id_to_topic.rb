class AddBuyerIdToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :buyer_id, :integer
  end
end
