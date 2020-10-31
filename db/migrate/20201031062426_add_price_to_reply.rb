class AddPriceToReply < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :price, :integer
  end
end
