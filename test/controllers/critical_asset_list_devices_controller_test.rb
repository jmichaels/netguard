require 'test_helper'

class SpecialDeviceListDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_device_list_device = special_device_list_devices(:one)
  end

  test "should get index" do
    get special_device_list_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_special_device_list_device_url
    assert_response :success
  end

  test "should create special_device_list_device" do
    assert_difference('SpecialDeviceListDevice.count') do
      post special_device_list_devices_url, params: { special_device_list_device: { special_device_list_id: @special_device_list_device.special_device_list_id, device_id: @special_device_list_device.device_id } }
    end

    assert_redirected_to special_device_list_device_url(SpecialDeviceListDevice.last)
  end

  test "should show special_device_list_device" do
    get special_device_list_device_url(@special_device_list_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_device_list_device_url(@special_device_list_device)
    assert_response :success
  end

  test "should update special_device_list_device" do
    patch special_device_list_device_url(@special_device_list_device), params: { special_device_list_device: { special_device_list_id: @special_device_list_device.special_device_list_id, device_id: @special_device_list_device.device_id } }
    assert_redirected_to special_device_list_device_url(@special_device_list_device)
  end

  test "should destroy special_device_list_device" do
    assert_difference('SpecialDeviceListDevice.count', -1) do
      delete special_device_list_device_url(@special_device_list_device)
    end

    assert_redirected_to special_device_list_devices_url
  end
end
