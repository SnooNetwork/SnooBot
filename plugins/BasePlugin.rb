require 'cinch'
module BasePlugin 
  
  def self.plugins
    @plugins ||=[]
  end

  def self.included(klass)
    plugins << klass
  end
end