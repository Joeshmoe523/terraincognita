class CreateFeedbackItems < ActiveRecord::Migration[8.0]
  def change
    create_table :feedback_items do |t|
      t.string :type
      t.string :token
      t.string :provider_name
      t.text :content
      t.text :situation
      t.text :behavior
      t.text :impact
      t.text :reflections
      t.references :growth_plan, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :feedback_items, :token, unique: true
  end
end
