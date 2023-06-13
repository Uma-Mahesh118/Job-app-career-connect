class CreateApplicant < ActiveRecord::Migration[7.0]
  def change
    create_table :s do |t|
      t.string :name
      t.string :email
      t.text :skills
      t.timestamps
    end
  end
end
