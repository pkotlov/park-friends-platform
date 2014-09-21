class PspacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_pspace, only: [:show, :edit, :update, :destroy]

  # GET /pspaces
  # GET /pspaces.json
  def index
    latitude_min = Float(params[:latitude_min])
    longitude_min = Float(params[:longitude_min])
    latitude_max = Float(params[:latitude_max])
    longitude_max = Float(params[:longitude_max])
    if(latitude_min != nil && longitude_min != nil && latitude_max != nil && longitude_max != nil)
      @pspaces = Pspace.where("latitude > ?", latitude_min).where("latitude < ?", latitude_max).where("longitude > ?", longitude_min).where("longitude < ?", longitude_max)
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
