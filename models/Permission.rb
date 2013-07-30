class Permission < ActiveRecord::Base
  has_and_belongs_to_many :dbobjects
  
  def self.has?(user,permission)
    
    if user.is_a?(String)
      user=DbObject.find_by_name_and_group(user,false)
      if user.nil?
        user=DbObject.find_by_name("Base")
      end  
    end
    
    perms=[]
    curObject=user
    until curObject.nil?
      perms=perms|curObject.permissions
      curObject=curObject.parent
    end
    valid=perms.select{|perm| PatternMatcher.instance.isMatches(perm.name,permission) }
    valid!=[]
  end
end