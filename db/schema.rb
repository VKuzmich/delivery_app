# frozen_string_literal: true

ActiveRecord::Schema.define(version: 2020_03_06_104808) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'couriers', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'packages', force: :cascade do |t|
    t.string 'tracking_number'
    t.boolean 'delivery_status'
    t.bigint 'courier_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['courier_id'], name: 'index_packages_on_courier_id'
  end

  add_foreign_key 'packages', 'couriers'
end
