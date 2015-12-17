class CreateCommunityResources < ActiveRecord::Migration
  def change
    create_table :community_resources do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :group
      t.datetime :created_date
      t.datetime :modified_date
      t.boolean :is_approved
      t.datetime :approved_date

      t.timestamps
    end
  end
end
