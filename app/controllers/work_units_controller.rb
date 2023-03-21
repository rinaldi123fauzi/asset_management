class WorkUnitsController < ApplicationController
  before_action :set_work_unit, only: %i[ show edit update destroy ]

  # GET /work_units or /work_units.json
  def index
    @work_units = WorkUnit.all
  end

  # GET /work_units/1 or /work_units/1.json
  def show
  end

  # GET /work_units/new
  def new
    @work_unit = WorkUnit.new
  end

  # GET /work_units/1/edit
  def edit
  end

  # POST /work_units or /work_units.json
  def create
    @work_unit = WorkUnit.new(work_unit_params)

    respond_to do |format|
      if @work_unit.save
        format.html { redirect_to work_unit_url(@work_unit), notice: "Work unit was successfully created." }
        format.json { render :show, status: :created, location: @work_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_units/1 or /work_units/1.json
  def update
    respond_to do |format|
      if @work_unit.update(work_unit_params)
        format.html { redirect_to work_unit_url(@work_unit), notice: "Work unit was successfully updated." }
        format.json { render :show, status: :ok, location: @work_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_units/1 or /work_units/1.json
  def destroy
    @work_unit.destroy

    respond_to do |format|
      format.html { redirect_to work_units_url, notice: "Work unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_unit
      @work_unit = WorkUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_unit_params
      params.require(:work_unit).permit(:nama)
    end
end
