class Permission < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :groups
  
  
  def self.has?(user,permission)
    
    if user.is_a?(String)
      user=User.find_by_account(user)
      if user.nil?
        return nil
      end  
    end
    
    perms=user.permissions
    valid=perms.select{|perm| PatternMatcher.instance.isMatches(perm.name,permission) }
    valid!=[]
  end
end