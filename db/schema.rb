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

ActiveRecord::Schema.define(version: 20170923172156) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "average_caches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "avg", limit: 24, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_average_caches_on_rater_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rating"
    t.integer "user_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_averages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "overall_avg", limit: 24, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable_type_and_rateable_id"
  end

  create_table "performances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rating"
    t.integer "user_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "stars", limit: 24, null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cacheable_type"
    t.bigint "cacheable_id"
    t.float "avg", limit: 24, null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable_type_and_cacheable_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "content"
    t.integer "site_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "link"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.string "title"
    t.string "preview_file_name"
    t.string "preview_content_type"
    t.integer "preview_file_size"
    t.datetime "preview_updated_at"
    t.integer "rating", default: 0
  end

  create_table "trusts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rating"
    t.integer "user_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
