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

ActiveRecord::Schema.define(version: 2021_06_03_095952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "uuid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
    t.index ["uuid"], name: "index_accounts_on_uuid"
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

  create_table "chat_actions", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.integer "chat_room_id"
    t.integer "chat_contact_id"
    t.string "content"
    t.string "trigger"
    t.datetime "last_send_at"
    t.string "status"
    t.jsonb "metadata"
    t.jsonb "reply_payload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "error_info"
    t.text "mention", default: [], array: true
  end

  create_table "chat_contacts", force: :cascade do |t|
    t.string "contact_uid"
    t.string "contact_name"
    t.string "avatar_url"
    t.string "contact_type"
    t.string "alias_name"
    t.string "marker"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bot_uid"
    t.text "room_uids", default: [], array: true
    t.index ["contact_name"], name: "index_chat_contacts_on_contact_name"
    t.index ["contact_uid"], name: "index_chat_contacts_on_contact_uid"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.string "room_uid"
    t.string "message_uid"
    t.string "chat_uid"
    t.jsonb "payload"
    t.text "content"
    t.string "contact_name"
    t.string "contact_uid"
    t.string "contact_avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "message_type"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "room_uid"
    t.string "room_topic"
    t.string "chat_uid"
    t.string "bot_uid"
    t.string "bot_weixin"
    t.string "status"
    t.string "mark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_templates", force: :cascade do |t|
    t.jsonb "payload", default: {}
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_tricks", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.text "content"
    t.jsonb "payload", default: {}
    t.string "message_type"
    t.string "trigger"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_action_logs", force: :cascade do |t|
    t.integer "webhook_id"
    t.integer "from_custom_action_id"
    t.integer "next_custon_action_id"
    t.integer "backpack_id"
    t.jsonb "original_params"
    t.jsonb "custom_params"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_actions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "custom_action"
    t.bigint "webhook_id", null: false
    t.string "category"
    t.jsonb "input_dict"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.index ["webhook_id"], name: "index_custom_actions_on_webhook_id"
  end

  create_table "operation_logs", force: :cascade do |t|
    t.string "user_id"
    t.string "params"
    t.string "action"
    t.string "controller"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "webhooks", force: :cascade do |t|
    t.string "uuid"
    t.string "receive_email"
    t.datetime "expired_at"
    t.integer "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "webhook_token"
    t.integer "user_id"
    t.integer "resp_code", default: 200
    t.string "resp_body", default: ""
    t.string "resp_content_type", default: "text/plain"
    t.boolean "cors_enabled", default: true
    t.text "script_content"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "custom_actions", "webhooks"
end
