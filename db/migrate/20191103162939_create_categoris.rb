class CreateCategoris < ActiveRecord::Migration[5.2]
  def change
    create_table :categoris do |t|
      t.string :cat_name
      t.string :cat_banner
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_description

      t.timestamps
    end
  end
end
