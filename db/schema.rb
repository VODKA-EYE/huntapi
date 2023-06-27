# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_626_203_109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'ammo_types', force: :cascade do |t|
    t.string 'name'
  end

  create_table 'consumables', force: :cascade do |t|
    t.string 'name'
    t.integer 'cost'
    t.string 'image_url'
  end

  create_table 'tools', force: :cascade do |t|
    t.string 'name'
    t.integer 'cost'
    t.integer 'usages'
    t.string 'image_url'
  end

  create_table 'weapons', force: :cascade do |t|
    t.string 'name'
    t.integer 'cost'
    t.integer 'ammo_amount'
    t.integer 'slot_size'
    t.bigint 'ammo_type_id'
    t.string 'image_url'
    t.index ['ammo_type_id'], name: 'index_weapons_on_ammo_type_id'
  end

  add_foreign_key 'weapons', 'ammo_types'
end
