require 'yati/tasks'

namespace :yati do
  desc 'Updates base translation based on primary locale yml files'
  task load_primary: :environment do
    Yati::Tasks.load_primary
  end

  desc 'Import all non default locale yml files to Yati'
  task import: :environment do
    Yati::Tasks.import_locales
  end
end
