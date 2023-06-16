class Messages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.text :msg 
      t.integer :flag
      t.timestamps
    end
  end
end
