require 'cinch'
require_relative 'Baseplugin'
class Hello 
  include BasePlugin
  include Cinch::Plugin 
  match "hello"
  match "addtest", method: :addtest
  match "perm1", method: :addPerm
  match "perm2", method: :addPerm2
  def execute(m)
    m.user.refresh
    m.reply "Hello, #{m.user.authname}"
  end
  
  def addtest(m)
    user= User.new(account: m.user.authname)
    user.save!
  end
  
  def addPerm(m)
    m.reply "Checking for test.this.that"
    m.reply Permission.has?("nekosune","test.this.that")
  end
  def addPerm2(m)
    m.reply "Checking for fail.this.that"
    m.reply Permission.has?("nekosune","fail.this.that")
  end
end