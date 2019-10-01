class OrganizationDevice < ApplicationRecord
  belongs_to :organization
  belongs_to :device
end
