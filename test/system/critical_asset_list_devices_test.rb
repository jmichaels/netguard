require "application_system_test_case"

class SpecialDeviceListDevicesTest < ApplicationSystemTestCase
  setup do
    @special_device_list_device = special_device_list_devices(:one)
  end

  test "visiting the index" do
    visit special_device_list_devices_url
    assert_selector "h1", text: "Critical Asset List Devices"
  end

  test "creating a Special device list device" do
    visit special_device_list_devices_url
    click_on "New Critical Asset List Device"

    fill_in "Special device list", with: @special_device_list_device.special_device_list_id
    fill_in "Device", with: @special_device_list_device.device_id
    click_on "Create Special device list device"

    assert_text "Special device list device was successfully created"
    click_on "Back"
  end

  test "updating a Special device list device" do
    visit special_device_list_devices_url
    click_on "Edit", match: :first

    fill_in "Special device list", with: @special_device_list_device.special_device_list_id
    fill_in "Device", with: @special_device_list_device.device_id
    click_on "Update Special device list device"

    assert_text "Special device list device was successfully updated"
    click_on "Back"
  end

  test "destroying a Special device list device" do
    visit special_device_list_devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Special device list device was successfully destroyed"
  end
end
