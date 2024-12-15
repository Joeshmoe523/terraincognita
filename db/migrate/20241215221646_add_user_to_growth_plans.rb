class AddUserToGrowthPlans < ActiveRecord::Migration[8.0]
  def change
    add_reference :growth_plans, :user, null: true, foreign_key: true
  end
end
