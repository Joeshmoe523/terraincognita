class CreateProgressUpdates < ActiveRecord::Migration[8.0]
  def change
    create_table :progress_updates do |t|
      t.string :token
      t.text :actions
      t.text :extractions
      t.references :user, null: false, foreign_key: true
      t.references :growth_plan, null: true, foreign_key: true

      t.timestamps
    end

    add_index :progress_updates, :token, unique: true
  end
end
