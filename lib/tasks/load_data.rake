desc "Load data into database from YAML files in db/data/.
Relies on Rails.env to determine database."

task :load_data => :environment do
  require 'active_record/fixtures'
  datadir = "#{Rails.root}/db/data"
  ActiveRecord::Base.establish_connection
  Dir.glob("#{datadir}/*.{yml,csv}").each do |file|
    Fixtures.create_fixtures('db/data', File.basename(file, '.*'))
  end
end
