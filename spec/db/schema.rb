ActiveRecord::Schema.define do
  create_table "settingify_settings", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
