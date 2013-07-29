require 'cinch'
require_relative 'Baseplugin'
class Hello 
  include BasePlugin
  include Cinch::Plugin 
  match "hello"
  match "addtest", method: :addtest
  match "addperm", method: :addPerm
  def execute(m)
    m.user.refresh
    m.reply "Hello, #{m.user.authname}"
  end
  
  def addtest(m)
    user= User.new(account: m.user.authname)
    user.save!
  end
  
  def addPerm(m)
    perm=Permission.find_by_name("test.*")
    user=User.find_by_account("nekosune")
    user.permissions << perm
    user.save!
  end
end