class DropTimestampsFromUpTable <  ActiveRecord::Migration
  def up
    remove_column "permissions_users","created_at"
    remove_column "permissions_users","updated_at"
  end
 
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end