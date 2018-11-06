class ValetDataController < ApplicationController
  before_action :set_valet_datum, only: [:show, :edit, :update, :destroy]

  # GET /valet_data
  # GET /valet_data.json
  def index
    @valet_data = ValetDatum.all.limit(20)
    @day = params[:day]
    @days_of_week = [ "sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday" ]
  end

  # GET /valet_data/1
  # GET /valet_data/1.json
  def show
  end

  # GET /valet_data/new
  def new
    @valet_datum = ValetDatum.new
  end

  # GET /valet_data/1/edit
  def edit
  end

  def import
    ValetDatum.import(params[:file])

    redirect_to valet_data_url, notice: 'Valet Data imported.'
  end

  # POST /valet_data
  # POST /valet_data.json
  def create
    @valet_datum = ValetDatum.new(valet_datum_params)

    respond_to do |format|
      if @valet_datum.save
        format.html { redirect_to @valet_datum, notice: 'Valet datum was successfully created.' }
        format.json { render :show, status: :created, location: @valet_datum }
      else
        format.html { render :new }
        format.json { render json: @valet_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valet_data/1
  # PATCH/PUT /valet_data/1.json
  def update
    respond_to do |format|
      if @valet_datum.update(valet_datum_params)
        format.html { redirect_to @valet_datum, notice: 'Valet datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @valet_datum }
      else
        format.html { render :edit }
        format.json { render json: @valet_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valet_data/1
  # DELETE /valet_data/1.json
  def destroy
    @valet_datum.destroy
    respond_to do |format|
      format.html { redirect_to valet_data_url, notice: 'Valet datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valet_datum
      @valet_datum = ValetDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valet_datum_params
      params.require(:valet_datum).permit(:ticket, :requested, :accepted, :assigned, :completed, :description)
    end
end
