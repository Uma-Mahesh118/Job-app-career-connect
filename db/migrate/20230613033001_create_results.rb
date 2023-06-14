class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.integer :post_id
      t.integer :applicant_id
      t.timestamps
    end
  end
end
