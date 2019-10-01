class SpecialDeviceList < ApplicationRecord
  has_many :special_device_list_devices
  has_many :devices, through: :special_device_list_devices
end
