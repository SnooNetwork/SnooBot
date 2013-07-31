require_relative '../lib/PermissionCondition'
require_relative '../lib/UsesDatabase'
class UserManagement
  include BasePlugin
  include Cinch::Plugin
  extend  MethodDecorators
  
  match /addUser (\w+)(?: )*(\w*)/i, method: :addUser
  match /removeUser (\w+)/i, method: :removeUser
  match "amiadmin", method: :isAdmin?
  
  +SnooDecorators::UsesDatabase
  +SnooDecorators::PermissionCondition.new("users.admin")
  def isAdmin?(m)
    m.reply "Yes I am admin"
  end
  
  +SnooDecorators::UsesDatabase
  +SnooDecorators::PermissionCondition.new("users.add")
  def addUser(m,userToAdd,group)
    if group.blank?
      group="Base"
    end
    m.reply "I add a User! #{userToAdd} to group #{group}"
    other_user=(m.bot.user_list.find_ensured userToAdd)
    if other_user.authname.nil?
      m.reply "Sorry, I can only add users who are logged on and authenticated"
      return
    end
    if not DbObject.where("lower(name)=?",other_user.authname.downcase).first.nil?
      m.reply "Sorry this user/group allready exists"
      return
    end
    groupob=DbObject.find_group(group).first
    if groupob.nil?
      m.reply "Sorry that group does not exist"
      return
    end
    user=DbObject.new(name: other_user.authname,group: false)
    user.parent=groupob
    user.save!
    m.reply "User Added!"
  end
  
  +SnooDecorators::UsesDatabase
  +SnooDecorators::PermissionCondition.new("users.remove")
  def removeUser(m,userToRemove)
    m.reply "I remove a User! #{userToRemove}"
    other_user=(m.bot.user_list.find_ensured userToRemove)
    user=DbObject.where("lower(name)=? AND db_objects.'group'=?",other_user.authname.downcase,false).first
    if user.nil?
      m.reply "Sorry this user does not exist"
      return
    end
    
    user.destroy
    m.reply "User removed"
  end
  
end