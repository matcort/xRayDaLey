class InfoleysController < ApplicationController
  before_action :set_infoley, only: [:show, :edit, :update, :destroy]

  # GET /infoleys
  # GET /infoleys.json
  def index
    @infoleys = Infoley.all
  end

  # GET /infoleys/1
  # GET /infoleys/1.json
  def show
  end

  # GET /infoleys/new
  def new
    @infoley = Infoley.new
  end

  # GET /infoleys/1/edit
  def edit
  end

  # POST /infoleys
  # POST /infoleys.json
  def create
    @infoley = Infoley.new(infoley_params)

    respond_to do |format|
      if @infoley.save
        format.html { redirect_to @infoley, notice: 'Infoley was successfully created.' }
        format.json { render :show, status: :created, location: @infoley }
      else
        format.html { render :new }
        format.json { render json: @infoley.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infoleys/1
  # PATCH/PUT /infoleys/1.json
  def update
    respond_to do |format|
      if @infoley.update(infoley_params)
        format.html { redirect_to @infoley, notice: 'Infoley was successfully updated.' }
        format.json { render :show, status: :ok, location: @infoley }
      else
        format.html { render :edit }
        format.json { render json: @infoley.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infoleys/1
  # DELETE /infoleys/1.json
  def destroy
    @infoley.destroy
    respond_to do |format|
      format.html { redirect_to infoleys_url, notice: 'Infoley was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infoley
      @infoley = Infoley.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def infoley_params
      params.require(:infoley).permit(:numero_ley, :fecha, :tipo, :exp_simpl, :cont_ley, :proy_ley)
    end
end
