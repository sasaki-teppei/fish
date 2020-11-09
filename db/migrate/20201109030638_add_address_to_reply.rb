class AddAddressToReply < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :address, :string
  end
end
