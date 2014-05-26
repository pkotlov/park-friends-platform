class FacebookRegistrationsController < ApplicationController
  before_action :set_facebook_registration, only: [:show, :edit, :update, :destroy]

  # GET /facebook_registrations
  # GET /facebook_registrations.json
  def index
    @facebook_registrations = FacebookRegistration.all
  end

  # GET /facebook_registrations/1
  # GET /facebook_registrations/1.json
  def show
  end

  # GET /facebook_registrations/new
  def new
    @facebook_registration = FacebookRegistration.new
  end

  # GET /facebook_registrations/1/edit
  def edit
  end

  # POST /facebook_registrations
  # POST /facebook_registrations.json
  def create
    @facebook_registration = FacebookRegistration.new(facebook_registration_params)

    respond_to do |format|
      if @facebook_registration.save
        format.html { redirect_to @facebook_registration, notice: 'Facebook registration was successfully created.' }
        format.json { render :show, status: :created, location: @facebook_registration }
      else
        format.html { render :new }
        format.json { render json: @facebook_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebook_registrations/1
  # PATCH/PUT /facebook_registrations/1.json
  def update
    respond_to do |format|
      if @facebook_registration.update(facebook_registration_params)
        format.html { redirect_to @facebook_registration, notice: 'Facebook registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebook_registration }
      else
        format.html { render :edit }
        format.json { render json: @facebook_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_registrations/1
  # DELETE /facebook_registrations/1.json
  def destroy
    @facebook_registration.destroy
    respond_to do |format|
      format.html { redirect_to facebook_registrations_url, notice: 'Facebook registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_registration
      @facebook_registration = FacebookRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_registration_params
      params.require(:facebook_registration).permit(:facebook, :facebookId, :name, :email)
    end
end
