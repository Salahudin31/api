class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :photo
      t.string :banner_photo
      t.string :description
      t.string :location
      t.string :start_date
      t.string :end_date
      t.string :last_booking_date
      t.string :itinerary
      t.string :price
      t.string :policy
      t.string :terms
      t.string :featured
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_description

      t.timestamps
    end
  end
end
