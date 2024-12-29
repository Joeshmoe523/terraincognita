class CreateRoleProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :role_profiles do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :current
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
