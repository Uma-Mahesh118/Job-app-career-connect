class AddPasswordToApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :password_digest, :string
    add_column :applicants, :check, :boolean, default: true
  end
end
