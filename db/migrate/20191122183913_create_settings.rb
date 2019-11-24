class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :logo
      t.string :favicon
      t.string :footer_copyright
      t.string :footer_address
      t.string :footer_email
      t.string :footer_phone
      t.string :header_email
      t.string :header_phone
      t.string :send_email_from
      t.string :send_email_to
      t.string :total_populer
      t.string :total_footer_tujuan_wisata
      t.string :total_sidebar_tujuan_wisata
      t.string :total_sidebar_article_populer
      t.string :total_sidebar_article_terbaru
      t.string :home_title_service
      t.string :home_subtitle_service
      t.string :home_status_service
      t.string :activity_title_service
      t.string :activity_subtitle_service
      t.string :activity_status_service
      t.string :catatan_title_service
      t.string :catatan_subtitle_service
      t.string :catatan_status_service
      t.string :destination_title_service
      t.string :destination_subtitle_service
      t.string :destination_status_service
      t.string :dalam_negeri_title_service
      t.string :dalam_negeri_subtitle_service
      t.string :dalam_negeri_status_service
      t.string :luar_negeri_title_service
      t.string :luar_negeri_subtitle_service
      t.string :luar_negeri_status_service
      t.string :news_letter_title_service
      t.string :news_letter_subtitle_service
      t.string :news_letter_status_service
      t.string :banner_activity
      t.string :banner_destination
      t.string :banner_catatan
      t.string :banner_contact
      t.string :banner_about
      t.string :photo_about
      t.string :banner_faq
      t.string :banner_team
      t.string :banner_payment
      t.string :banner_payment_success
      t.string :banner_payment_pending
      t.string :banner_login
      t.string :banner_register
      t.string :banner_forget_password
      t.string :banner_reset_password
      t.string :banner_reset_password_success
      t.string :banner_verify_register
      t.string :paypal_email

      t.timestamps
    end
  end
end
