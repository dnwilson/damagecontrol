# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140619152214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: true do |t|
    t.datetime "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shipping_state"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "flyer"
    t.string   "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_html"
  end

  add_index "events", ["id", "venue_id"], name: "index_events_on_id_and_venue_id", using: :btree
  add_index "events", ["id"], name: "index_events_on_id", unique: true, using: :btree

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "preview_pic"
    t.date     "date"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_html"
  end

  add_index "galleries", ["id", "event_id"], name: "index_galleries_on_id_and_event_id", using: :btree
  add_index "galleries", ["id"], name: "index_galleries_on_id", using: :btree

  create_table "inventories", force: true do |t|
    t.integer  "product_id"
    t.integer  "xsmall"
    t.integer  "small"
    t.integer  "medium"
    t.integer  "large"
    t.integer  "xlarge"
    t.integer  "xxlarge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventories", ["id", "product_id"], name: "index_inventories_on_id_and_product_id", unique: true, using: :btree

  create_table "line_items", force: true do |t|
    t.decimal  "unit_price"
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size"
  end

  add_index "line_items", ["id", "product_id", "cart_id"], name: "index_line_items_on_id_and_product_id_and_cart_id", unique: true, using: :btree

  create_table "members", force: true do |t|
    t.string   "name"
    t.boolean  "artist",             default: false
    t.string   "title"
    t.text     "bio"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "soundcloud"
    t.string   "reverbnation"
    t.string   "youtube"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "members", ["id"], name: "index_members_on_id", unique: true, using: :btree

  create_table "order_transactions", force: true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_transactions", ["id", "order_id"], name: "index_order_transactions_on_id_and_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "cart_id"
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.string   "billing_address"
    t.string   "shipping_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.string   "status"
    t.string   "shipping_address2"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_zip"
    t.string   "shipping_country"
    t.decimal  "shipping_cost"
    t.decimal  "subtotal"
    t.decimal  "total"
  end

  add_index "orders", ["id", "user_id", "cart_id"], name: "index_orders_on_id_and_user_id_and_cart_id", unique: true, using: :btree

  create_table "payment_notifications", force: true do |t|
    t.text     "params"
    t.integer  "cart_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "name"
    t.integer  "gallery_id"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["id", "gallery_id"], name: "index_photos_on_id_and_gallery_id", using: :btree
  add_index "photos", ["id"], name: "index_photos_on_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "body_html"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "posts", ["id", "user_id"], name: "index_posts_on_id_and_user_id", unique: true, using: :btree

  create_table "product_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "downloadable",        default: false
    t.decimal  "price"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "products", ["id", "product_category_id"], name: "index_products_on_id_and_product_category_id", unique: true, using: :btree
  add_index "products", ["id"], name: "index_products_on_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_state"
    t.string   "billing_zip"
    t.string   "billing_city"
    t.string   "billing_country"
    t.string   "shipping_first_name"
    t.string   "shipping_last_name"
    t.string   "shipping_address1"
    t.string   "shipping_address2"
    t.string   "shipping_state"
    t.string   "shipping_zip"
    t.string   "shipping_city"
    t.string   "shipping_country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["id"], name: "index_venues_on_id", using: :btree

  create_table "videos", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "event_id"
    t.date     "date"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_html"
  end

  add_index "videos", ["id", "event_id"], name: "index_videos_on_id_and_event_id", using: :btree
  add_index "videos", ["id"], name: "index_videos_on_id", using: :btree

end
