namespace :development do

  desc 'Truncate all application created tables and run db:seed'
  task truncate_db_and_seed: :environment do
    check_production_mode!

    Rake::Task['development:truncate_tables'].invoke
    Rake::Task['db:seed'].invoke
  end

  desc 'Truncate all application created tables'
  task truncate_db: :environment do
    check_production_mode!
    
    

    excluded_tables = %w[ar_internal_metadata schema_migrations]
    tables = DbHelper.all_tables - excluded_tables

    tables.sort.each do |table|
      puts "Truncating #{table} ... "
      ActiveRecord::Base.connection.execute("truncate table #{table} cascade")
    end
  end
end

def check_production_mode!
  raise 'It can only be run in development' unless Rails.env.development?
end

