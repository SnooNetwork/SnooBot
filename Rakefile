require 'snoo'
require 'highline/import'
require 'rubygems'
require 'active_record'
task :default => [:config]

task :config do
  @hl = HighLine.new

  puts @hl.color("Enter your reddit username and password", :bold, :cyan)
  puts @hl.color("-" * @hl.output_cols, :bold, :cyan)
  username = @hl.ask('Username: ')

  password = @hl.ask('Password: ') { |x| x.echo = "*" }

  @s = Snoo::Client.new(username: username, password: password)

  puts @hl.color("Copy and paste the following to the top of your ", :bold, :cyan) + @hl.color("config/application.yml", :bold, :green) + @hl.color(" file, replacing the old lines:", :bold, :cyan)
  puts "reddit: "
  puts "\tmodhash: #{@s.modhash}"
  puts "\tcookies: #{@s.cookies.split(/(reddit_session=.*?);/)[1]}"
end

task :run do
  ruby "Snoobot.rb"
end

task :migrate, [:migration] do |t, args|
  args.with_defaults(:migration => nil)
  ActiveRecord::Base.establish_connection( :adapter => "sqlite3",:database => "snoobot.db")
  ActiveRecord::Migrator.migrate "./migrations/", args.migration
end