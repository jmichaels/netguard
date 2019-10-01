require "application_system_test_case"

class SpecialDeviceListsTest < ApplicationSystemTestCase
  setup do
    @special_device_list = special_device_lists(:one)
  end

  test "visiting the index" do
    visit special_device_lists_url
    assert_selector "h1", text: "Critical Asset Lists"
  end

  test "creating a Special device list" do
    visit special_device_lists_url
    click_on "New Critical Asset List"

    fill_in "Name", with: @special_device_list.name
    click_on "Create Special device list"

    assert_text "Special device list was successfully created"
    click_on "Back"
  end

  test "updating a Special device list" do
    visit special_device_lists_url
    click_on "Edit", match: :first

    fill_in "Name", with: @special_device_list.name
    click_on "Update Special device list"

    assert_text "Special device list was successfully updated"
    click_on "Back"
  end

  test "destroying a Special device list" do
    visit special_device_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Special device list was successfully destroyed"
  end
end
