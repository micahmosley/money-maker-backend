class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.integer :amount
      t.integer :line_id
      t.integer :user_id
      t.string :result

      t.timestamps
    end
  end
end
