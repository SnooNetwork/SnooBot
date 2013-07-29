require 'sqlite3'
require 'singleton'
class DatabaseHandler
  include Singleton

  def initialize()
    
  end
  
  def connect()
    ActiveRecord::Base.establish_connection( :adapter => "sqlite3",:database => "snoobot.db")
  end
end