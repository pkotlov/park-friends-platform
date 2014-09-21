class PspacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_pspace, only: [:show, :edit, :update, :destroy]

  # GET /pspaces
  # GET /pspaces.json
  def index
    latitude = Integer(params[:latitude])
    longitude = Integer(params[:longitude])
    radius = Integer(params[:radius])
    if(latitude != nil && longitude != nil && radius != nil)
      latitude_min = latitude - radius
      latitude_max = latitude + radius
      longitude_min = longitude - radius
      longitude_max = longitude + radius
      @pspaces = Pspace.where("latitude > ?", latitude_min)
    else
      @pspaces = Pspace.all
    end
    rescue
      @pspaces = Pspace.all
  end

  # GET /pspaces/1
  # GET /pspaces/1.json
  def show
  end

  # GET /pspaces/new
  def new
    @pspace = Pspace.new
  end

  # GET /pspaces/1/edit
  def edit
  end

  # POST /pspaces
  # POST /pspaces.json
  def create
    @pspace = Pspace.new(pspace_params)

    respond_to do |format|
      if @pspace.save
        format.html { redirect_to @pspace, notice: 'Pspace was successfully created.' }
        format.json { render :show, status: :created, location: @pspace }
      else
        format.html { render :new }
        format.json { render json: @pspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pspaces/1
  # PATCH/PUT /pspaces/1.json
  def update
    respond_to do |format|
      if @pspace.update(pspace_params)
        format.html { redirect_to @pspace, notice: 'Pspace was successfully updated.' }
        format.json { render :show, status: :ok, location: @pspace }
      else
        format.html { render :edit }
        format.json { render json: @pspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pspaces/1
  # DELETE /pspaces/1.json
  def destroy
    @pspace.destroy
    respond_to do |format|
      format.html { redirect_to pspaces_url, notice: 'Pspace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pspace
      @pspace = Pspace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pspace_params
      params.require(:pspace).permit(:address, :latitude, :longitude, :availability, :post_on_facebook, :parked)
    end
end
