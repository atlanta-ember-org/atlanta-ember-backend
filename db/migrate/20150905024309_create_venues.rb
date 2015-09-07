class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :country
      t.string :city
      t.string :address_1
      t.integer :yes_rsvp_count
      t.string :name
      t.float :lon
      t.float :lat
      t.boolean :repinned
      t.string :uid

      t.timestamps
    end
  end
end
