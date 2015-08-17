class MeetupSyncWorker
  include Sidekiq::Worker

  def perform
    UsersSyncer.sync
  end
end
