require 'cinch'
require_relative 'Baseplugin'
class Hello 
  include BasePlugin
  include Cinch::Plugin 
  match "hello"
  match "addtest", method: :addtest
  def execute(m)
    m.user.refresh
    m.reply "Hello, #{m.user.authname}"
  end
  
  def addtest(m)
    user= User.new(account: m.user.authname)
    user.save!
  end
end