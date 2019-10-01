json.extract! user, :id, :first_name, :last_name, :employee_id, :email_address, :organization_id, :created_at, :updated_at
json.url user_url(user, format: :json)
