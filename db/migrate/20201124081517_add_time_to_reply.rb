class AddTimeToReply < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :time, :datetime
  end
end
