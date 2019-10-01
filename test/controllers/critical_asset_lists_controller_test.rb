require 'test_helper'

class SpecialDeviceListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_device_list = special_device_lists(:one)
  end

  test "should get index" do
    get special_device_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_special_device_list_url
    assert_response :success
  end

  test "should create special_device_list" do
    assert_difference('SpecialDeviceList.count') do
      post special_device_lists_url, params: { special_device_list: { name: @special_device_list.name } }
    end

    assert_redirected_to special_device_list_url(SpecialDeviceList.last)
  end

  test "should show special_device_list" do
    get special_device_list_url(@special_device_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_device_list_url(@special_device_list)
    assert_response :success
  end

  test "should update special_device_list" do
    patch special_device_list_url(@special_device_list), params: { special_device_list: { name: @special_device_list.name } }
    assert_redirected_to special_device_list_url(@special_device_list)
  end

  test "should destroy special_device_list" do
    assert_difference('SpecialDeviceList.count', -1) do
      delete special_device_list_url(@special_device_list)
    end

    assert_redirected_to special_device_lists_url
  end
end
