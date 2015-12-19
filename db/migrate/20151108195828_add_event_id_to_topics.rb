class AddEventIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :event_id, :integer
  end
end
