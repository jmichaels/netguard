class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :hostname
      t.string :ip_address
      t.string :category
      t.string :manufacturer
      t.string :mac_address
      t.string :operating_system
      t.string :operating_system_version
      t.decimal :memory_total_gb
      t.decimal :memory_used_gb
      t.decimal :storage_capacity_tb
      t.decimal :storage_used_tb
      t.string :processor_name
      t.integer :processor_cores
      t.integer :processor_threads
      t.decimal :processor_clock_speed_ghz

      t.timestamps
    end
  end
end
