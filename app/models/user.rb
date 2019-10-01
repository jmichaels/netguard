class User < ApplicationRecord
  belongs_to :organization
  has_many :user_devices
  has_many :devices, through: :user_devices
end