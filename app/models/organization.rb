class Organization < ApplicationRecord
  has_many :users
  has_many :organization_devices
  has_many :devices, through: :organization_devices
end
