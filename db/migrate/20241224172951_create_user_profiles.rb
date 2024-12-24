class CreateUserProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :pronouns
      t.date :date_of_birth
      t.string :timezone
      t.string :location
      t.string :linkedin_url
      t.string :portfolio_url

      t.timestamps
    end
  end
end
