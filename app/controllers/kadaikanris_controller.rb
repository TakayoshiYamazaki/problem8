class KadaikanrisController < ApplicationController
  before_action :set_kadaikanri, only: %i[ show edit update destroy ]

  # GET /kadaikanris or /kadaikanris.json
  def index
    @q = Kadaikanri.includes(:status).ransack(params[:q])
    @pagy, @kadaikanris = pagy(@q.result)
  end

  # GET /kadaikanris/1 or /kadaikanris/1.json
  def show
  end

  # GET /kadaikanris/new
  def new
    @kadaikanri = Kadaikanri.new
  end

  # GET /kadaikanris/1/edit
  def edit
  end

  # POST /kadaikanris or /kadaikanris.json
  def create
    @kadaikanri = Kadaikanri.new(kadaikanri_params)

    respond_to do |format|
      if @kadaikanri.save
        format.html { redirect_to @kadaikanri, notice: "Kadaikanri was successfully created." }
        format.json { render :show, status: :created, location: @kadaikanri }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kadaikanri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kadaikanris/1 or /kadaikanris/1.json
  def update
    respond_to do |format|
      if @kadaikanri.update(kadaikanri_params)
        format.html { redirect_to @kadaikanri, notice: "Kadaikanri was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @kadaikanri }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kadaikanri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kadaikanris/1 or /kadaikanris/1.json
  def destroy
    @kadaikanri.destroy!

    respond_to do |format|
      format.html { redirect_to kadaikanris_path, notice: "Kadaikanri was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kadaikanri
      @kadaikanri = Kadaikanri.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def kadaikanri_params
      params.expect(kadaikanri: [ :no, :entrydate, :reporter, :location, :content, :plan, :status_id ])
    end
end
