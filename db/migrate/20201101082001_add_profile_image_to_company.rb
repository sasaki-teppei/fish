class AddProfileImageToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :profile_image, :string
  end
end
