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

ActiveRecord::Schema[7.0].define(version: 2022_11_25_091428) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assessments", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "assessable_type", null: false
    t.bigint "assessable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["itemable_id", "itemable_type"], name: "index_cart_items_on_itemable_id_and_itemable_type"
    t.index ["itemable_type", "itemable_id"], name: "index_cart_items_on_itemable"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "discount_amount_cents", default: 0
    t.integer "sub_total_amount_cents"
    t.integer "total_amount_cents", null: false
    t.bigint "coupon_id"
    t.bigint "user_id"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_carts_on_coupon_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_chapters_on_course_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "title"
    t.integer "discount_amount_cents"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "course_coaches", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_coaches_on_course_id"
    t.index ["user_id"], name: "index_course_coaches_on_user_id"
  end

  create_table "course_details", force: :cascade do |t|
    t.string "share_link"
    t.integer "page_visit"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_details_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level", default: 0
    t.jsonb "meta_data"
    t.integer "price_cents"
  end

  create_table "educational_details", force: :cascade do |t|
    t.integer "educational_type"
    t.string "institution"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address_line1"
    t.string "address_line2"
    t.index ["user_id"], name: "index_educational_details_on_user_id"
  end

  create_table "file_imports", force: :cascade do |t|
    t.string "associated_model_name"
    t.string "added_by_type", null: false
    t.bigint "added_by_id", null: false
    t.jsonb "error_report"
    t.datetime "completed_at", precision: nil
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_type", "added_by_id"], name: "index_file_imports_on_added_by"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "chapter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_lessons_on_chapter_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "loggable_type", null: false
    t.bigint "loggable_id", null: false
    t.string "log_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loggable_type", "loggable_id"], name: "index_logs_on_loggable"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "last_name"
    t.integer "age"
    t.datetime "dob", precision: nil
    t.integer "gender"
    t.string "mobile_number"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zoom_registrations", force: :cascade do |t|
    t.string "registrant_name"
    t.integer "zoom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
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
end
