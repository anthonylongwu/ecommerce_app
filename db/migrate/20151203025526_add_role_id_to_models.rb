class AddRoleIdToModels < ActiveRecord::Migration
  def change
    add_column :models, :role_id, :integer, default: 2
  end
end
