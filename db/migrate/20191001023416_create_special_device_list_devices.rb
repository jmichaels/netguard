class CreateSpecialDeviceListDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :special_device_list_devices do |t|
      t.references :special_device_list, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
