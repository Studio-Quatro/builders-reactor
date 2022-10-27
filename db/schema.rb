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

ActiveRecord::Schema[7.0].define(version: 2022_10_27_041237) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "buildxact_categories", force: :cascade do |t|
    t.string "name"
    t.string "category_id"
    t.string "subcategory"
    t.string "subcategory_id"
    t.string "item_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id"], name: "index_buildxact_categories_on_subcategory_id", unique: true
  end

  create_table "buildxact_items", force: :cascade do |t|
    t.string "catalogue_description"
    t.string "category"
    t.string "cost_item_type"
    t.string "description"
    t.string "catalogue_id"
    t.string "catalogue_category_id"
    t.string "bxa_id"
    t.string "catalogue_sub_category_id"
    t.string "image_url"
    t.boolean "is_recipe"
    t.string "sub_category"
    t.string "supplier_code"
    t.float "unit_cost"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bxa_id"], name: "index_buildxact_items_on_bxa_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "wc_id"
    t.string "slug"
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wc_id"], name: "index_categories_on_wc_id", unique: true
  end

  create_table "category_maps", force: :cascade do |t|
    t.string "bxa_id"
    t.string "bw_id"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_maps_on_category_id"
  end

  create_table "item_comparisons", force: :cascade do |t|
    t.string "supplier_code"
    t.integer "status"
    t.datetime "date_of_evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "category"
    t.string "cost_item_type"
    t.string "description"
    t.string "catalogue_category_id"
    t.string "external_id"
    t.string "catalogue_sub_category_id"
    t.string "image_url"
    t.boolean "is_recipe"
    t.string "sub_category"
    t.string "supplier_code"
    t.float "unit_cost"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_items_on_external_id", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "category_maps", "categories"
end
