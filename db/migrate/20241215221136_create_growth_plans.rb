class CreateGrowthPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :growth_plans do |t|
      # Basic Properties
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :status

      # Motivations
      t.text :impact
      t.string :macro_skill
      t.string :micro_skill
      t.text :success_criteria

      # Focus Area
      t.string :focus_area
      t.string :category
      t.string :scope

      t.timestamps
    end
  end
end
