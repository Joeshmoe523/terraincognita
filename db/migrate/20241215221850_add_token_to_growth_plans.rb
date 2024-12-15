class AddTokenToGrowthPlans < ActiveRecord::Migration[8.0]
  def change
    add_column :growth_plans, :token, :string
    add_index :growth_plans, :token, unique: true
  end
end
