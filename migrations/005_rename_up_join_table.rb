class RenameUpJoinTable <  ActiveRecord::Migration
  def up
    rename_table "users_permissions","permissions_users"
  end
 
  def down
    rename_table "permissions_users","users_permissions"
  end
end