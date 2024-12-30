class AddTokenToRoleProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :role_profiles, :token, :string
    add_index :role_profiles, :token, unique: true
  end
end
