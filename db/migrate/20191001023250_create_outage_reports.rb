class CreateOutageReports < ActiveRecord::Migration[6.0]
  def change
    create_table :outage_reports do |t|
      t.string :category
      t.references :device, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.text :description

      t.timestamps
    end
  end
end
