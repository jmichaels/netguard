class CreateSpecialDeviceLists < ActiveRecord::Migration[6.0]
  def change
    create_table :special_device_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
