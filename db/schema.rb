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

ActiveRecord::Schema.define(version: 2021_04_02_002922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "institution_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_institution_types_on_name", unique: true
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name", null: false
    t.string "document", limit: 14
    t.bigint "institution_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document"], name: "index_institutions_on_document", unique: true
    t.index ["institution_type_id"], name: "index_institutions_on_institution_type_id"
    t.index ["name"], name: "index_institutions_on_name", unique: true
  end

  create_table "registrations", force: :cascade do |t|
    t.float "total_price", null: false
    t.integer "bill_quantity", null: false
    t.integer "due_date", null: false
    t.string "course_name", null: false
    t.bigint "institution_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_registrations_on_institution_id"
    t.index ["student_id"], name: "index_registrations_on_student_id"
  end

# Could not dump table "students" because of following StandardError
#   Unknown type 'gender_type' for column 'gender'

  add_foreign_key "institutions", "institution_types"
  add_foreign_key "registrations", "institutions"
  add_foreign_key "registrations", "students"
end
