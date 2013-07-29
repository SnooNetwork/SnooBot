class CreateUsersPermissionsTable <  ActiveRecord::Migration
  def up
    create_table "users_permissions",:id=>false  do |t|
      t.integer "user_id", :null=>false
      t.integer "permission_id", :null=>false
      t.timestamps
    end
  end
 
  def down
    drop_table "users_permissions"
  end
end