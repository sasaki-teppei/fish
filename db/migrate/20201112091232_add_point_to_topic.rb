class AddPointToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :point, :integer
  end
end
