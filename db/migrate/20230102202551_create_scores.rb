class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :strike
      t.integer :spare
      t.integer :total

      t.timestamps
    end
  end
end
