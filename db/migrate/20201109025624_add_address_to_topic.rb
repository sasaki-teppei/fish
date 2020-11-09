class AddAddressToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :address, :string
  end
end
