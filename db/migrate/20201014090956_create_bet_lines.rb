class CreateBetLines < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_lines do |t|
      t.integer :bet_id
      t.integer :line_id

      t.timestamps
    end
  end
end
