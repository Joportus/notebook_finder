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

ActiveRecord::Schema[7.0].define(version: 2022_02_20_012828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "computers", force: :cascade do |t|
    t.string "name"
    t.string "cpu"
    t.string "ram"
    t.string "storage"
    t.string "screen"
    t.string "integrated_gpu"
    t.string "discrete_gpu"
    t.string "details_url"
    t.integer "apps_score"
    t.integer "gaming_score"
    t.integer "movility_score"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "weight"
  end

  create_table "searches", force: :cascade do |t|
    t.integer "budget"
    t.string "use_case"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "weight"
  end

end
