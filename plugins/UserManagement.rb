require_relative '../lib/PermissionCondition'
class UserManagement
  include BasePlugin
  include Cinch::Plugin
  extend  MethodDecorators
  match "addUser", method: :addUser
  
  +MethodDecorators::PermissionCondition.new("users.add")
  def addUser(m)
    m.reply "I should fail!"
  end
  
end