class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.string :type
      t.integer :odds

      t.timestamps
    end
  end
end
