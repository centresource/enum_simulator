require 'rubygems'

def prep_db
  dir = File.dirname(__FILE__)
  ActiveRecord::Base.configurations = {'test' => {:adapter => 'sqlite3', :database => ":memory:"}}
  ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])

  ActiveRecord::Migration.verbose = false

  load "#{dir}/resources/schema"
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
require 'active_record'
require 'enum_simulator'

prep_db

require File.dirname(__FILE__)+'/../init.rb'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
