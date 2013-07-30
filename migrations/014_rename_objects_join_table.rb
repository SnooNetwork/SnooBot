class RenameObjectsJoinTable <  ActiveRecord::Migration
  def up
    rename_table :objects_permissions,:db_objects_permissions
  end
 
  def down
    rename_table :db_objects_permissions,:objects_permissions
  end
end