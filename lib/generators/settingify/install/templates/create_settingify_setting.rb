class CreateSettingifySetting < ActiveRecord::Migration
  def change
    create_table :settingify_setting do |t|
      t.string :key
      t.string :value
      t.string :description
      t.timestamps
    end
  end
end
