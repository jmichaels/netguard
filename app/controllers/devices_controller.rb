class DevicesController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @devices = Device.all
      end

      format.json do
        @devices = Device.paginate(page: params[:page], per_page: 50)
        response = {
          returned_records: @devices.count,
          results: @devices
        }
        render json: response.to_json
      end
    end
  end

  def show
    @device = Device.find(params[:id])
  end 
end
