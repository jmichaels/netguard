class SpecialDeviceListDevice < ApplicationRecord
  belongs_to :special_device_list
  belongs_to :device
end
