class RenameObjectsTable <  ActiveRecord::Migration
  def up
    rename_table "objects","db_objects"
  end
 
  def down
    rename_table "db_objects","objects"
  end
end