class SpecialDeviceListsController < ApplicationController
  before_action :set_special_device_list, only: [:show, :edit, :update, :destroy]

  # GET /special_device_lists
  # GET /special_device_lists.json
  def index
    @special_device_lists = SpecialDeviceList.all
  end

  # GET /special_device_lists/1
  # GET /special_device_lists/1.json
  def show
  end

  # GET /special_device_lists/new
  def new
    @special_device_list = SpecialDeviceList.new
  end

  # GET /special_device_lists/1/edit
  def edit
  end

  # POST /special_device_lists
  # POST /special_device_lists.json
  def create
    @special_device_list = SpecialDeviceList.new(special_device_list_params)

    respond_to do |format|
      if @special_device_list.save
        format.html { redirect_to @special_device_list, notice: 'Special device list was successfully created.' }
        format.json { render :show, status: :created, location: @special_device_list }
      else
        format.html { render :new }
        format.json { render json: @special_device_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_device_lists/1
  # PATCH/PUT /special_device_lists/1.json
  def update
    respond_to do |format|
      if @special_device_list.update(special_device_list_params)
        format.html { redirect_to @special_device_list, notice: 'Special device list was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_device_list }
      else
        format.html { render :edit }
        format.json { render json: @special_device_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_device_lists/1
  # DELETE /special_device_lists/1.json
  def destroy
    @special_device_list.destroy
    respond_to do |format|
      format.html { redirect_to special_device_lists_url, notice: 'Special device list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_device_list
      @special_device_list = SpecialDeviceList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_device_list_params
      params.require(:special_device_list).permit(:name)
    end
end
