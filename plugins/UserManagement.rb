require_relative '../lib/PermissionCondition'
class UserManagement
  include BasePlugin
  include Cinch::Plugin
  extend  MethodDecorators
  
  match /addUser (.+)/i, method: :addUser

  +SnooDecorators::PermissionCondition.new("users.add")
  def addUser(m,userToAdd)
    m.reply "I add a User! #{userToAdd}"
  end
  
  

  
end