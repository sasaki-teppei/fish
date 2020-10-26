class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :phone_number
      t.string :address
      t.string :image_name

      t.timestamps
    end
  end
end
