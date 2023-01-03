class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :lane
      t.string :oil_condition

      t.timestamps
    end
  end
end
