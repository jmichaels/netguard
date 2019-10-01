class CreateOrganizationDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_devices do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
