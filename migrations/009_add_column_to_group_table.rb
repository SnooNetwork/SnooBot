class AddColumnToGroupTable <  ActiveRecord::Migration
  def up
    add_column "groups","parent_id",:integer
  end
 
  def down
    remove_column "groups","parent_id"
  end
end