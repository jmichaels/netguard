class SpecialDeviceListDevicesController < ApplicationController
  before_action :set_special_device_list_device, only: [:show, :edit, :update, :destroy]

  # GET /special_device_list_devices
  # GET /special_device_list_devices.json
  def index
    @special_device_list_devices = SpecialDeviceListDevice.all
  end

  # GET /special_device_list_devices/1
  # GET /special_device_list_devices/1.json
  def show
  end

  # GET /special_device_list_devices/new
  def new
    @special_device_list_device = SpecialDeviceListDevice.new
  end

  # GET /special_device_list_devices/1/edit
  def edit
  end

  # POST /special_device_list_devices
  # POST /special_device_list_devices.json
  def create
    @special_device_list_device = SpecialDeviceListDevice.new(special_device_list_device_params)

    respond_to do |format|
      if @special_device_list_device.save
        format.html { redirect_to @special_device_list_device, notice: 'Special device list device was successfully created.' }
        format.json { render :show, status: :created, location: @special_device_list_device }
      else
        format.html { render :new }
        format.json { render json: @special_device_list_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_device_list_devices/1
  # PATCH/PUT /special_device_list_devices/1.json
  def update
    respond_to do |format|
      if @special_device_list_device.update(special_device_list_device_params)
        format.html { redirect_to @special_device_list_device, notice: 'Special device list device was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_device_list_device }
      else
        format.html { render :edit }
        format.json { render json: @special_device_list_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_device_list_devices/1
  # DELETE /special_device_list_devices/1.json
  def destroy
    @special_device_list_device.destroy
    respond_to do |format|
      format.html { redirect_to special_device_list_devices_url, notice: 'Special device list device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_device_list_device
      @special_device_list_device = SpecialDeviceListDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_device_list_device_params
      params.require(:special_device_list_device).permit(:special_device_list_id, :device_id)
    end
end
