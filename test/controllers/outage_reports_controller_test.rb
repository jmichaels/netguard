require 'test_helper'

class OutageReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outage_report = outage_reports(:one)
  end

  test "should get index" do
    get outage_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_outage_report_url
    assert_response :success
  end

  test "should create outage_report" do
    assert_difference('OutageReport.count') do
      post outage_reports_url, params: { outage_report: { category: @outage_report.category, description: @outage_report.description, device_id: @outage_report.device_id, ended_at: @outage_report.ended_at, started_at: @outage_report.started_at } }
    end

    assert_redirected_to outage_report_url(OutageReport.last)
  end

  test "should show outage_report" do
    get outage_report_url(@outage_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_outage_report_url(@outage_report)
    assert_response :success
  end

  test "should update outage_report" do
    patch outage_report_url(@outage_report), params: { outage_report: { category: @outage_report.category, description: @outage_report.description, device_id: @outage_report.device_id, ended_at: @outage_report.ended_at, started_at: @outage_report.started_at } }
    assert_redirected_to outage_report_url(@outage_report)
  end

  test "should destroy outage_report" do
    assert_difference('OutageReport.count', -1) do
      delete outage_report_url(@outage_report)
    end

    assert_redirected_to outage_reports_url
  end
end
