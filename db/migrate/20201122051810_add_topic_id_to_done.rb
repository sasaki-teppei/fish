class AddTopicIdToDone < ActiveRecord::Migration[5.2]
  def change
    add_column :dones, :topic_id, :integer
  end
end
