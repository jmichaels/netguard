require "application_system_test_case"

class OutageReportsTest < ApplicationSystemTestCase
  setup do
    @outage_report = outage_reports(:one)
  end

  test "visiting the index" do
    visit outage_reports_url
    assert_selector "h1", text: "Outage Reports"
  end

  test "creating a Outage report" do
    visit outage_reports_url
    click_on "New Outage Report"

    fill_in "Category", with: @outage_report.category
    fill_in "Description", with: @outage_report.description
    fill_in "Device", with: @outage_report.device_id
    fill_in "Ended at", with: @outage_report.ended_at
    fill_in "Started at", with: @outage_report.started_at
    click_on "Create Outage report"

    assert_text "Outage report was successfully created"
    click_on "Back"
  end

  test "updating a Outage report" do
    visit outage_reports_url
    click_on "Edit", match: :first

    fill_in "Category", with: @outage_report.category
    fill_in "Description", with: @outage_report.description
    fill_in "Device", with: @outage_report.device_id
    fill_in "Ended at", with: @outage_report.ended_at
    fill_in "Started at", with: @outage_report.started_at
    click_on "Update Outage report"

    assert_text "Outage report was successfully updated"
    click_on "Back"
  end

  test "destroying a Outage report" do
    visit outage_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Outage report was successfully destroyed"
  end
end
