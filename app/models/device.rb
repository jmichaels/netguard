class Device < ApplicationRecord
  has_many :user_devices
  has_many :users, through: :user_devices
  has_many :outage_reports
  has_many :organization_devices
  has_many :organizations, through: :organization_devices
end
