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

ActiveRecord::Schema.define(version: 20180417013653) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "appearances", force: :cascade do |t|
    t.string   "image_background", limit: 255
    t.string   "theme_name",       limit: 255
    t.string   "setting_id",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "customizes", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.boolean  "installed",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "subtitle",   limit: 65535
    t.string   "banner",     limit: 255
    t.string   "slug",       limit: 255
    t.integer  "position",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cover",      limit: 255
  end

  add_index "destinations", ["slug"], name: "index_destinations_on_slug", unique: true, using: :btree

  create_table "destinations_plans", force: :cascade do |t|
    t.integer "destination_id", limit: 4
    t.integer "plan_id",        limit: 4
  end

  add_index "destinations_plans", ["destination_id"], name: "index_destinations_plans_on_destination_id", using: :btree
  add_index "destinations_plans", ["plan_id"], name: "index_destinations_plans_on_plan_id", using: :btree

  create_table "excursions", force: :cascade do |t|
    t.string   "banner",         limit: 255
    t.string   "title",          limit: 255
    t.text     "subtitle",       limit: 65535
    t.string   "days",           limit: 255
    t.string   "destination_id", limit: 255
    t.string   "slug",           limit: 255
    t.integer  "position",       limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "price",          limit: 255
    t.string   "type_activity",  limit: 255,   default: ""
    t.integer  "coupon",         limit: 4,     default: 0
    t.string   "type_days",      limit: 255
    t.string   "type_coupons",   limit: 255
    t.string   "offer",          limit: 255,   default: ""
    t.string   "plus",           limit: 255,   default: ""
    t.text     "url",            limit: 65535
  end

  add_index "excursions", ["slug"], name: "index_excursions_on_slug", unique: true, using: :btree

  create_table "excursions_views", force: :cascade do |t|
    t.integer "view_id",      limit: 4
    t.integer "excursion_id", limit: 4
  end

  add_index "excursions_views", ["excursion_id"], name: "index_excursions_views_on_excursion_id", using: :btree
  add_index "excursions_views", ["view_id"], name: "index_excursions_views_on_view_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "google_adwords", force: :cascade do |t|
    t.string   "url",           limit: 255
    t.string   "campaign_name", limit: 255
    t.text     "description",   limit: 65535
    t.text     "script",        limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "google_analytics_settings", force: :cascade do |t|
    t.string   "ga_account_id",  limit: 255
    t.string   "ga_tracking_id", limit: 255
    t.boolean  "ga_status",      limit: 1
    t.integer  "setting_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "banner",         limit: 255
    t.string   "title",          limit: 255
    t.text     "subtitle",       limit: 65535
    t.string   "days",           limit: 255
    t.string   "destination_id", limit: 255
    t.string   "slug",           limit: 255
    t.integer  "position",       limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "price",          limit: 255
    t.integer  "coupon",         limit: 4,     default: 0
    t.string   "type_days",      limit: 255
    t.string   "type_coupons",   limit: 255
    t.string   "offer",          limit: 255,   default: ""
    t.string   "plus",           limit: 255,   default: ""
    t.text     "url",            limit: 65535
  end

  add_index "hotels", ["slug"], name: "index_hotels_on_slug", unique: true, using: :btree

  create_table "hotels_views", force: :cascade do |t|
    t.integer "view_id",  limit: 4
    t.integer "hotel_id", limit: 4
  end

  add_index "hotels_views", ["hotel_id"], name: "index_hotels_views_on_hotel_id", using: :btree
  add_index "hotels_views", ["view_id"], name: "index_hotels_views_on_view_id", using: :btree

  create_table "meta_tags", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.text     "meta_tags",   limit: 65535
    t.string   "url",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "banner",         limit: 255
    t.string   "title",          limit: 255
    t.text     "subtitle",       limit: 65535
    t.string   "days",           limit: 255
    t.string   "destination_id", limit: 255
    t.string   "slug",           limit: 255
    t.integer  "position",       limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "price",          limit: 255
    t.integer  "coupon",         limit: 4,     default: 0
    t.string   "type_days",      limit: 255
    t.string   "type_coupons",   limit: 255
    t.string   "offer",          limit: 255,   default: ""
    t.string   "plus",           limit: 255,   default: ""
    t.text     "url",            limit: 65535
  end

  add_index "plans", ["slug"], name: "index_plans_on_slug", unique: true, using: :btree

  create_table "plans_views", force: :cascade do |t|
    t.integer "view_id", limit: 4
    t.integer "plan_id", limit: 4
  end

  add_index "plans_views", ["plan_id"], name: "index_plans_views_on_plan_id", using: :btree
  add_index "plans_views", ["view_id"], name: "index_plans_views_on_view_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "scripts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "script",     limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "phone",       limit: 255
    t.string   "mobile",      limit: 255
    t.string   "email",       limit: 255
    t.string   "logo",        limit: 255
    t.string   "favicon",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "smtp_settings", force: :cascade do |t|
    t.string   "address",     limit: 255
    t.string   "port",        limit: 255
    t.string   "domain_name", limit: 255
    t.string   "email",       limit: 255
    t.string   "password",    limit: 255
    t.integer  "setting_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "social_accounts", force: :cascade do |t|
    t.string   "facebook",    limit: 255
    t.string   "twitter",     limit: 255
    t.string   "instagram",   limit: 255
    t.string   "google_plus", limit: 255
    t.string   "tripadvisor", limit: 255
    t.string   "pinterest",   limit: 255
    t.string   "flickr",      limit: 255
    t.string   "behance",     limit: 255
    t.string   "dribbble",    limit: 255
    t.string   "tumblr",      limit: 255
    t.string   "github",      limit: 255
    t.string   "linkedin",    limit: 255
    t.string   "soundcloud",  limit: 255
    t.string   "youtube",     limit: 255
    t.string   "skype",       limit: 255
    t.string   "vimeo",       limit: 255
    t.integer  "setting_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "permalink",              limit: 255
    t.string   "username",               limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "views", force: :cascade do |t|
    t.string   "banner",     limit: 255
    t.string   "name",       limit: 255
    t.string   "subtitle",   limit: 255
    t.string   "slug",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "month",      limit: 255, default: "--- []\n"
  end

end
