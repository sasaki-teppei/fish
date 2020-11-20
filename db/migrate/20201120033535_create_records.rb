class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :company_id
      t.integer :record

      t.timestamps
    end
  end
end
