class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :meetup_id
      t.string :serialized_venue
      t.string :name
      t.string :event_url
      t.integer :yes_rsvp_count
      t.text :description
      t.string :status
      t.datetime :originally_created_at
      t.datetime :starts_at

      t.timestamps
    end
  end
end
