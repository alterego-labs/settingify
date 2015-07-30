namespace :settingify do
  desc 'Syncs defined settings with DB'
  task sync: :environment do
    Settingify::DbSyncer.new.call
  end
end

