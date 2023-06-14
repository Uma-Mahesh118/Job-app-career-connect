class AddMatchesCount < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :matches, :int
  end
end
