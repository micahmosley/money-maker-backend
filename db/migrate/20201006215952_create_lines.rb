class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.string :team
      t.string :opponent
      t.string :line_type
      t.string :odds
      t.integer :spread
      t.string :result

      t.timestamps
    end
  end
end
