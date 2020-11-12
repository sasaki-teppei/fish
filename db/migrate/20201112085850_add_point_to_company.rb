class AddPointToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :point, :integer
  end
end
