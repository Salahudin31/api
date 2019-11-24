class CreateCatatanPerjalanans < ActiveRecord::Migration[5.2]
  def change
    create_table :catatan_perjalanans do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :banner_photo
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_description

      t.timestamps
    end
  end
end
