class CreateSubscribes < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribes do |t|
      t.string :email
      t.string :date
      t.string :date_time
      t.string :active

      t.timestamps
    end
  end
end
