# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_16_100316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "action_trails", force: :cascade do |t|
    t.string "entity_type"
    t.integer "entity_id"
    t.integer "trail_type"
    t.string "event_name", null: false
    t.integer "actor_id"
    t.jsonb "entity_changes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_name"
    t.integer "country_id"
    t.integer "state_id"
    t.integer "city_id"
    t.string "pincode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "access_token"
    t.datetime "expires_at", precision: 6
    t.boolean "active"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "assessable_type", null: false
    t.bigint "assessable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assessable_type", "assessable_id"], name: "index_assessments_on_assessable"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "discount_amount_cents", default: 0
    t.integer "sub_total_amount_cents"
    t.integer "total_amount_cents", null: false
    t.bigint "cart_id", null: false
    t.string "itemable_type"
    t.bigint "itemable_id"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["itemable_id", "itemable_type"], name: "index_cart_items_on_itemable_id_and_itemable_type"
    t.index ["itemable_type", "itemable_id"], name: "index_cart_items_on_itemable"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "discount_amount_cents", default: 0
    t.integer "sub_total_amount_cents"
    t.integer "total_amount_cents", null: false
    t.integer "tax_amount_cents", default: 0
    t.bigint "coupon_id"
    t.bigint "user_id"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_id"], name: "index_carts_on_coupon_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_chapters_on_course_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "title"
    t.integer "discount_amount_cents"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.boolean "is_active", default: false
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "course_coaches", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_coaches_on_course_id"
    t.index ["user_id"], name: "index_course_coaches_on_user_id"
  end

  create_table "course_details", force: :cascade do |t|
    t.string "share_link"
    t.integer "page_visit"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_details_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "level", default: 0
    t.jsonb "meta_data"
    t.integer "price_cents"
  end

  create_table "educational_details", force: :cascade do |t|
    t.integer "educational_type"
    t.string "institution"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address_line1"
    t.string "address_line2"
    t.index ["user_id"], name: "index_educational_details_on_user_id"
  end

  create_table "file_imports", force: :cascade do |t|
    t.string "associated_model_name"
    t.string "added_by_type", null: false
    t.bigint "added_by_id", null: false
    t.jsonb "error_report"
    t.datetime "completed_at"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["added_by_type", "added_by_id"], name: "index_file_imports_on_added_by"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "chapter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_lessons_on_chapter_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "location_type"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "loggable_type", null: false
    t.bigint "loggable_id", null: false
    t.string "log_content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loggable_type", "loggable_id"], name: "index_logs_on_loggable"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "total_amount_cents"
    t.bigint "product_id", null: false
    t.integer "product_price_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "otp_requests", force: :cascade do |t|
    t.string "otp"
    t.datetime "expired_at", precision: 6
    t.integer "status"
    t.datetime "verified_at", precision: 6
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_otp_requests_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "display_review"
    t.integer "review_count"
    t.string "product_type", default: [], array: true
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "total_amount_cents", null: false
    t.integer "status", default: 0
    t.datetime "completed_at"
    t.string "rzp_order_id", null: false
    t.bigint "cart_id", null: false
    t.bigint "user_id", null: false
    t.string "mode_of_payment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_transactions_on_cart_id"
    t.index ["status"], name: "index_transactions_on_status"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.integer "age"
    t.datetime "dob"
    t.integer "gender"
    t.string "mobile_number"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zoom_registrations", force: :cascade do |t|
    t.string "registrant_name"
    t.integer "zoom_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "api_keys", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "carts", "coupons"
  add_foreign_key "carts", "users"
  add_foreign_key "chapters", "courses"
  add_foreign_key "coupons", "users"
  add_foreign_key "course_coaches", "courses"
  add_foreign_key "course_coaches", "users"
  add_foreign_key "course_details", "courses"
  add_foreign_key "educational_details", "users"
  add_foreign_key "lessons", "chapters"
  add_foreign_key "order_items", "products"
  add_foreign_key "otp_requests", "users"
  add_foreign_key "transactions", "carts"
  add_foreign_key "transactions", "users"
end
