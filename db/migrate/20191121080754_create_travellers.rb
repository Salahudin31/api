class CreateTravellers < ActiveRecord::Migration[5.2]
  def change
    create_table :travellers do |t|
      t.string :trav_name
      t.string :trav_photo
      t.string :trav_email
      t.string :trav_phone
      t.string :trav_address
      t.string :trav_city
      t.string :trav_state
      t.string :trav_country
      t.string :password_digest
      t.string :trav_access

      t.timestamps
    end
  end
end
