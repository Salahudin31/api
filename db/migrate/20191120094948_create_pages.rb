class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :mt_home
      t.string :mk_home
      t.string :md_home
      t.string :about_heading
      t.string :about_content
      t.string :mt_about
      t.string :mk_about
      t.string :md_about
      t.string :faq_heading
      t.string :faq_content
      t.string :mt_faq
      t.string :mk_faq
      t.string :md_faq
      t.string :activity_heading
      t.string :activity_content
      t.string :mt_activity
      t.string :mk_activity
      t.string :md_activity
      t.string :contact_heading
      t.string :contact_address
      t.string :contact_email
      t.string :contact_phone
      t.string :contact_map
      t.string :mt_contact
      t.string :mk_contact
      t.string :md_contact
      t.string :search_heading
      t.string :mt_search
      t.string :mk_search
      t.string :md_search
      t.string :term_heading
      t.string :term_content
      t.string :mt_term
      t.string :mk_term
      t.string :md_term
      t.string :privacy_heading
      t.string :privacy_content
      t.string :mt_privacy
      t.string :mk_privacy
      t.string :md_privacy
      t.string :team_heading
      t.string :team_content
      t.string :mt_team
      t.string :mk_team
      t.string :md_team

      t.timestamps
    end
  end
end
