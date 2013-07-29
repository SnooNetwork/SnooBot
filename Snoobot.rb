$LOAD_PATH << './lib'
$LOAD_PATH << './plugins'
require 'pp'
Dir[File.dirname(__FILE__)+'/plugins/*.rb'].each { |file| require file}
Dir[File.dirname(__FILE__)+'/libs/*.rb'].each { |file| require file}
bot=Cinch::Bot.new  do
  configure do |c|
    c.server="irc.snoonet.org"
    c.channels=["##testbots"]
    c.plugins.plugins=BasePlugin.plugins
  end
end
bot.start