class RenameObjectJoinColumn <  ActiveRecord::Migration
  def up
    rename_column :db_objects_permissions,:object_id,:db_object_id
  end
 
  def down
    rename_column :db_objects_permissions,:db_object_id,:object_id
  end
end