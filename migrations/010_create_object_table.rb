class CreateObjectTable <  ActiveRecord::Migration
  def up
    create_table :objects do |t|
      t.string :name
      t.boolean :group
      t.integer :parent_id
      t.timestamps
    end
  end
 
  def down
    drop_table :objects
  end
end