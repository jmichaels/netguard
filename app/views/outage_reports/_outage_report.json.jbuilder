json.extract! outage_report, :id, :category, :device_id, :started_at, :ended_at, :description, :created_at, :updated_at
json.url outage_report_url(outage_report, format: :json)
