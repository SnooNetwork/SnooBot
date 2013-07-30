class DeleteOldTables <  ActiveRecord::Migration
  def up
    drop_table :users
    drop_table :groups
    drop_table :permissions_users
    drop_table :groups_permissions
  end
 
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end