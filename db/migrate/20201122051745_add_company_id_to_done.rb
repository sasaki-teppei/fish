class AddCompanyIdToDone < ActiveRecord::Migration[5.2]
  def change
    add_column :dones, :company_id, :integer
  end
end
