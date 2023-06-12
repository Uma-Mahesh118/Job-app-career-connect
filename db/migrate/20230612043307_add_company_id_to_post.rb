class AddCompanyIdToPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :companyid 
    add_column :posts, :company_id, :int
  end
end
