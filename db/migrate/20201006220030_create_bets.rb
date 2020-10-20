class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.string :bet_type
      t.integer :risk
      t.float :odds
      t.float :current_odds
      t.integer :wins
      t.string :result
      t.integer :legs_left
      t.string :atleast_one_winner
      t.string :atleast_one_push

      t.timestamps
    end
  end
end
