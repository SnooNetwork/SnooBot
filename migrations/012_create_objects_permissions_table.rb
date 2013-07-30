class CreateObjectsPermissionsTable <  ActiveRecord::Migration
  def up
    create_table :objects_permissions,:id=>false do |t|
      t.integer "object_id", :null=>false
      t.integer "permission_id", :null=>false
    end
  end
 
  def down
    drop_table :objects_permissions
  end
end