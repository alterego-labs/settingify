class CreateSettingifySetting < ActiveRecord::Migration
  def change
    create_table Settingify::TABLE_NAME do |t|
      t.string :key
      t.string :value
      t.string :description
      t.timestamps
    end
  end
end
