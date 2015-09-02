namespace :meetup_sync do
  desc "sync all from meetup API"
  task all: :environment do
    puts MeetupSyncWorker.perform_async
  end
end
