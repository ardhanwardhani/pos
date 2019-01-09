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

ActiveRecord::Schema.define(version: 20190109092605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bussinesses", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.string "telephone"
    t.string "province"
    t.string "city"
    t.string "type_bussiness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "pin"
    t.string "type_employee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "income_items", force: :cascade do |t|
    t.integer "income_stock_id"
    t.string "itemable_type"
    t.integer "itemable_id"
    t.integer "amount"
    t.integer "unit_price"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "income_stocks", force: :cascade do |t|
    t.integer "outlet_id"
    t.datetime "date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authable_type"
    t.integer "authable_id"
    t.string "id_income_stock"
  end

  create_table "members", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "telephone"
    t.string "id_member"
    t.string "email"
    t.string "date_of_birth"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outcome_items", force: :cascade do |t|
    t.integer "outcome_stock_id"
    t.string "amount"
    t.string "itemable_type"
    t.integer "itemable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outcome_stocks", force: :cascade do |t|
    t.integer "outlet_id"
    t.datetime "date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authable_type"
    t.integer "authable_id"
    t.string "id_outcome_stock"
  end

  create_table "outlets", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "address"
    t.string "city"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "transaction_id"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permits", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "outlet_id"
    t.string "permitable_type"
    t.integer "permitable_id"
    t.string "permit_android"
    t.string "permit_backoffice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "product_number"
    t.string "barcode"
    t.string "type_unit"
    t.string "status"
    t.text "description"
    t.string "tax"
    t.string "type"
    t.integer "category_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "group_varians"
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer "purchase_order_id"
    t.integer "amount"
    t.integer "unit_price"
    t.integer "total"
    t.string "itemable_type"
    t.integer "itemable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer "outlet_id"
    t.integer "supplier_id"
    t.string "no_po"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authable_type"
    t.integer "authable_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "telephone"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "transaction_items", force: :cascade do |t|
    t.integer "transaction_id"
    t.string "itemable_type"
    t.integer "itemable_id"
    t.string "amount_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "member_id"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "user_staffs", force: :cascade do |t|
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "telephone"
    t.string "province"
    t.string "city"
    t.string "type_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "varians", force: :cascade do |t|
    t.integer "product_id"
    t.string "name"
    t.integer "price"
    t.string "product_number"
    t.string "barcode"
    t.string "type_unit"
    t.string "status"
    t.text "description"
    t.string "tax"
    t.string "type"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

end
