class CreateLuarNegeris < ActiveRecord::Migration[5.2]
  def change
    create_table :luar_negeris do |t|
      t.string :name
      t.string :photo
      t.string :banner_photo
      t.string :description
      t.string :short_description
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_description

      t.timestamps
    end
  end
end
