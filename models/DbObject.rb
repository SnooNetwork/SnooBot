class DbObject < ActiveRecord::Base
  has_and_belongs_to_many :permissions
  has_many :children, :class_name => "DbObject",:foreign_key => "parent_id"
  belongs_to :parent, :class_name => "DbObject"
  
  
  
  def IsGroup?
    return self.group==true
  end
  
  def self.find_group(groupname)
    return self.where("lower(name)=? AND db_objects.'group'=?",groupname,true)
  end
end