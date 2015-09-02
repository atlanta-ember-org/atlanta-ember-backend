class MeetupSyncWorker
  include Sidekiq::Worker

  def perform
    UsersSyncer.sync
    EventsSyncer.sync
  end
end
