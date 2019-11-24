class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.string :photo
      t.string :heading
      t.string :content
      t.string :button_text
      t.string :button_url

      t.timestamps
    end
  end
end
