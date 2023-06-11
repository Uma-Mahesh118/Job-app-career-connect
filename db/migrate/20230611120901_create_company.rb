class CreateCompany < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :companyname
      t.string :email
      t.string :location
      t.timestamps
    end
  end
end
