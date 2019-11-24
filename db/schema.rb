# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_22_183913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "short_description"
    t.string "photo"
    t.string "banner_photo"
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catatan_perjalanans", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.string "banner_photo"
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoris", force: :cascade do |t|
    t.string "cat_name"
    t.string "cat_banner"
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dalam_negeris", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "banner_photo"
    t.string "description"
    t.string "short_description"
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "luar_negeris", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "banner_photo"
    t.string "description"
    t.string "short_description"
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "banner_photo"
    t.string "description"
    t.string "location"
    t.string "start_date"
    t.string "end_date"
    t.string "last_booking_date"
    t.string "itinerary"
    t.string "price"
    t.string "policy"
    t.string "terms"
    t.string "featured"
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "mt_home"
    t.string "mk_home"
    t.string "md_home"
    t.string "about_heading"
    t.string "about_content"
    t.string "mt_about"
    t.string "mk_about"
    t.string "md_about"
    t.string "faq_heading"
    t.string "faq_content"
    t.string "mt_faq"
    t.string "mk_faq"
    t.string "md_faq"
    t.string "activity_heading"
    t.string "activity_content"
    t.string "mt_activity"
    t.string "mk_activity"
    t.string "md_activity"
    t.string "contact_heading"
    t.string "contact_address"
    t.string "contact_email"
    t.string "contact_phone"
    t.string "contact_map"
    t.string "mt_contact"
    t.string "mk_contact"
    t.string "md_contact"
    t.string "search_heading"
    t.string "mt_search"
    t.string "mk_search"
    t.string "md_search"
    t.string "term_heading"
    t.string "term_content"
    t.string "mt_term"
    t.string "mk_term"
    t.string "md_term"
    t.string "privacy_heading"
    t.string "privacy_content"
    t.string "mt_privacy"
    t.string "mk_privacy"
    t.string "md_privacy"
    t.string "team_heading"
    t.string "team_content"
    t.string "mt_team"
    t.string "mk_team"
    t.string "md_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "logo"
    t.string "favicon"
    t.string "footer_copyright"
    t.string "footer_address"
    t.string "footer_email"
    t.string "footer_phone"
    t.string "header_email"
    t.string "header_phone"
    t.string "send_email_from"
    t.string "send_email_to"
    t.string "total_populer"
    t.string "total_footer_tujuan_wisata"
    t.string "total_sidebar_tujuan_wisata"
    t.string "total_sidebar_article_populer"
    t.string "total_sidebar_article_terbaru"
    t.string "home_title_service"
    t.string "home_subtitle_service"
    t.string "home_status_service"
    t.string "activity_title_service"
    t.string "activity_subtitle_service"
    t.string "activity_status_service"
    t.string "catatan_title_service"
    t.string "catatan_subtitle_service"
    t.string "catatan_status_service"
    t.string "destination_title_service"
    t.string "destination_subtitle_service"
    t.string "destination_status_service"
    t.string "dalam_negeri_title_service"
    t.string "dalam_negeri_subtitle_service"
    t.string "dalam_negeri_status_service"
    t.string "luar_negeri_title_service"
    t.string "luar_negeri_subtitle_service"
    t.string "luar_negeri_status_service"
    t.string "news_letter_title_service"
    t.string "news_letter_subtitle_service"
    t.string "news_letter_status_service"
    t.string "banner_activity"
    t.string "banner_destination"
    t.string "banner_catatan"
    t.string "banner_contact"
    t.string "banner_about"
    t.string "photo_about"
    t.string "banner_faq"
    t.string "banner_team"
    t.string "banner_payment"
    t.string "banner_payment_success"
    t.string "banner_payment_pending"
    t.string "banner_login"
    t.string "banner_register"
    t.string "banner_forget_password"
    t.string "banner_reset_password"
    t.string "banner_reset_password_success"
    t.string "banner_verify_register"
    t.string "paypal_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string "photo"
    t.string "heading"
    t.string "content"
    t.string "button_text"
    t.string "button_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socials", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribes", force: :cascade do |t|
    t.string "email"
    t.string "date"
    t.string "date_time"
    t.string "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travellers", force: :cascade do |t|
    t.string "trav_name"
    t.string "trav_photo"
    t.string "trav_email"
    t.string "trav_phone"
    t.string "trav_address"
    t.string "trav_city"
    t.string "trav_state"
    t.string "trav_country"
    t.string "password_digest"
    t.string "trav_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
