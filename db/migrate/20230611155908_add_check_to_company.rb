class AddCheckToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :check, :boolean, default: false
  end
end
