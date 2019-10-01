class PagesController < ApplicationController
  def home
    # Devices currently experiencing an outage
    @current_outage_devices = []

    # Devices with the highest level vulnerabilities
    @highly_vulnerable_devices = []

    # Ticker log of most recent systems experiencing critical errors
    @critical_system_errors = []

    # Of Vulnerabilities found in recent scans for each org
    @vulnerabilities_by_org = []

    @devices_per_organization_names  = Organization.all.map{ |o| o.name }
    @devices_per_organization_counts = Organization.all.map{ |o| o.devices.count }

    @vulnerabilities_over_time = VulnerabilityScanResult.group_by_day(:scanned_at)
    @outages_per_day = OutageReport.group_by_day(:started_at).count
    
    @outages_per_day_labels = @outages_per_day.keys.map{ |k| k.to_s }
    @outages_per_day_counts = @outages_per_day.values

    @outages_per_day_by_org = get_outages_per_day_by_org

    @special_devices_in_unexpected_outage_state = []

    @special_devices_with_upcoming_maintenance_outages = []
  end

  def network

  end

  def about
  end

  private

    def get_outages_per_day_by_org
      Organization.all.each do |org|
      end

      []
    end
end