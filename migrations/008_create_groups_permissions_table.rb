class CreateGroupsPermissionsTable <  ActiveRecord::Migration
  def up
    create_table "groups_permissions",:id=>false  do |t|
      t.integer "group_id", :null=>false
      t.integer "permission_id", :null=>false
    end
  end
 
  def down
    drop_table "groups_permissions"
  end
end