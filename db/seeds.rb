# https://github.com/ffaker/ffaker/blob/master/REFERENCE.md#ffakerinternet
# https://github.com/ffaker/ffaker/blob/master/REFERENCE.md#ffakerfilesystem

require 'ostruct'

domain_suffix = "fizznet.com"

device_categories = [
  "server",
  "desktop",
  "laptop",
  # "switch",
  # "router"
]

manufacturers = [
  "Dell",
  "HPE",
  "Lenovo",
  "IBM",
  #"Cisco"
]

operating_systems = [
  OpenStruct.new(
    name: "CentOS",
    versions: ["6.0", "6.1", "6.2", "6.3", "7.0", "7.1", "7.2", "7.3", "7.4", "7.5"]
  ),
  OpenStruct.new(
    name: "Windows",
    versions: ["7", "7", "7", "7", "10", "10", "10", "10", "10", "Server 2019", "Server 2016"],
  ),
  OpenStruct.new(
    name: "RHEL",
    versions: ["6.0", "6.1", "6.2", "6.3", "7.0", "7.1", "7.2", "7.3", "7.4", "7.5"]
  )
]

processors = [
  OpenStruct.new(
    name: "AMD Ryzen 7 3700X",
    cores: 8,
    hyper_threading: true,
    clock_speed: 3.6
  ),
  OpenStruct.new(
    name: "Intel Core i7-9700K",
    cores: 8,
    hyper_threading: true,
    clock_speed: 3.6
  ),
  OpenStruct.new(
    name: "Intel Core i5-9600K",
    cores: 6,
    hyper_threading: true,
    clock_speed: 3.7
  ),
  OpenStruct.new(
    name: "Intel Xeon E5-2699 V4",
    cores: 22,
    hyper_threading: true,
    clock_speed: 2.2
  ),
  OpenStruct.new(
    name: "Intel Pentium E5500",
    cores: 2,
    hyper_threading: true,
    clock_speed: 2.8
  ),
  OpenStruct.new(
    name: "Intel Celeron G4900",
    cores: 2,
    hyper_threading: true,
    clock_speed: 3.1
  ),
  OpenStruct.new(
    name: "AMD Threadripper 2990WX",
    cores: 32,
    hyper_threading: true,
    clock_speed: 3
  )
]

# XXX DELETE EVERYTHING XXX
puts "Deleting everything!"
SpecialDeviceListDevice.delete_all
UserDevice.delete_all
User.delete_all
Organization.delete_all
OrganizationDevice.delete_all
OutageReport.delete_all
VulnerabilityScanResult.delete_all
SpecialDeviceList.delete_all
Device.delete_all
# XXX ---------------- XXX

# --- Organizations ---

puts "Generating Organizations"
10.times do
  charset = Array('A'..'Z')

  Organization.create!(
    name: charset.sample + charset.sample + charset.sample
  )

end

organization_ids = Organization.pluck(:id)

# --- Users ---

puts "Generating Users"

1000.times do
  fname = FFaker::Name.first_name
  lname = FFaker::Name.last_name
  User.create!(
    first_name: fname,
    last_name: lname,
    organization_id: organization_ids.sample,
    employee_id: rand(100000..900000),
    email_address: fname.first + lname + rand(1..100).to_s + "@" + domain_suffix,
  )
end

user_ids = User.pluck(:id)

# --- Devices ---

puts "Generating Devices"
1000.times do
  #domain_suffix = "fizznet.com"

  processor           = processors.sample
  os                  = operating_systems.sample
  mem_total           = [2, 4, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 32, 32, 64, 64].sample
  mem_used            = (mem_total * rand(0.05..0.95)).ceil(1)
  storage_capacity_tb = [0.250, 0.500, 1, 2, 3, 4, 6, 8, 20].sample
  storage_used_tb     = (storage_capacity_tb * rand(0.05..0.95)).ceil(1) 

  ip_address = "10.10.#{rand(0..255)}.#{rand(0..255)}"

  Device.create!(
    hostname:                   "#{FFaker::Internet.domain_word}_#{rand(1..100)}.#{domain_suffix}",
    ip_address:                 ip_address,
    category:                   device_categories.sample,
    manufacturer:               manufacturers.sample,
    mac_address:                FFaker::Internet.mac,
    operating_system:           os.name,
    operating_system_version:   os.versions.sample,
    memory_total_gb:            mem_total,
    memory_used_gb:             mem_used,
    storage_capacity_tb:        storage_capacity_tb,
    storage_used_tb:            storage_used_tb,
    processor_name:             processor.name,
    processor_cores:            processor.cores,
    processor_threads:          processor.cores * 2,
    processor_clock_speed_ghz:  processor.clock_speed,
  )
end

device_ids = Device.pluck(:id)


# --- UserDevices - Assign each user a random device ---

puts "Generating User Devices"
user_ids.each do |user_id|
  UserDevice.create!(
    user_id: user_id,
    device_id: device_ids.sample
  )
end

# --- VulnerabilityScanResults - Generate vulnerability reports ---

puts "Generating Vulnerability Scan Results"
250.times do
  VulnerabilityScanResult.create!(
    device_id: device_ids.sample,
    threat_level: rand(1..5),
    scanned_at: FFaker::Time.between(3.months.ago, 1.day.ago),
    description: FFaker::Lorem.sentence
  )
end


# --- Outage Reports ---

puts "Generating Outage Reports"
200.times do
  outage_type = ["unexpected_outage", "planned_maintenance"].sample

  if outage_type == "unexpected_outage"
    resolved = [true, false, false].sample
    started_at = FFaker::Time.between(1.week.ago, 1.hour.ago)
    ended_at = resolved ? FFaker::Time.between(started_at, 1.minute.ago) : nil
  elsif outage_type == "planned_maintenance"
    started_at = FFaker::Time.between(1.month.ago, 1.month.from_now)
    ended_at = FFaker::Time.between(started_at, started_at + 1.week)
  end

  OutageReport.create!(
    started_at: started_at,
    ended_at: ended_at,
    device_id: device_ids.sample,
    category: outage_type,
    description: FFaker::Lorem.sentence
  )
end

# --- Organization Devices ---

Device.find_each do |device|
  num_owners = rand(1..10) < 2 ? 2 : 1
  num_owners.times do
    OrganizationDevice.create!(
      device_id: device.id,
      organization_id: organization_ids.sample
    )
  end
end

# --- Special Device Lists ---

puts "Generating Critical Asset Lists"
cal = SpecialDeviceList.create!(name: "Primary Critical Asset List")
25.times do
  cal.devices << Device.find(device_ids.sample)
end
