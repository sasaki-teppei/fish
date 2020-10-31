class AddPriceToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :price, :integer
  end
end
