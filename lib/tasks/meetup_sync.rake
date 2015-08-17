namespace :meetup_sync do
  desc "sync users from meetup API"
  task users: :environment do
    puts MeetupSyncWorker.perform_async
  end
end
