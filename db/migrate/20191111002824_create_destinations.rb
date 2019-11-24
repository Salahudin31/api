class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :title
      t.string :description
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_description

      t.timestamps
    end
  end
end
