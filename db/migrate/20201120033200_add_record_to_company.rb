class AddRecordToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :record, :integer
  end
end
