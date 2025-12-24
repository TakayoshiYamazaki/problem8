class KadaikanrisController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  before_action :set_kadaikanri, only: %i[ show edit update destroy ]

  def export_xlsx
    # @kadaikanris = Kadaikanri.all # Or use @q.result if you want to export filtered data
    @q = Kadaikanri.includes(:status).order(updated_at: :desc).ransack(params[:q])
    @kadaikanris = @q.result
    
    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]
    worksheet.add_cell(0, 0, "番号")
    worksheet.add_cell(0, 1, "登録日")
    worksheet.add_cell(0, 2, "報告者")
    worksheet.add_cell(0, 3, "場所")
    worksheet.add_cell(0, 4, "内容")
    worksheet.add_cell(0, 5, "対応方針")
    worksheet.add_cell(0, 6, "ステータス")
    worksheet.add_cell(0, 7, "更新日")

    @kadaikanris.each_with_index do |kadaikanri, index|
      row = index + 1
      worksheet.add_cell(row, 0, kadaikanri.no)
      worksheet.add_cell(row, 1, kadaikanri.entrydate&.strftime("%Y/%m/%d"))
      worksheet.add_cell(row, 2, kadaikanri.reporter)
      worksheet.add_cell(row, 3, kadaikanri.location)
      worksheet.add_cell(row, 4, kadaikanri.content)
      worksheet.add_cell(row, 5, kadaikanri.plan)
      worksheet.add_cell(row, 6, kadaikanri.status.name)
      worksheet.add_cell(row, 7, kadaikanri.updated_at&.strftime("%Y/%m/%d %H:%M:%S"))
    end

    send_data workbook.stream.read,
              type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
              filename: "kadaikanris.xlsx"
  end

  # GET /kadaikanris or /kadaikanris.json or /kadaikanris.pdf
  def index
    @q = Kadaikanri.includes(:status).order(updated_at: :desc).ransack(params[:q])
    @pagy, @kadaikanris = pagy(@q.result)

    respond_to do |format|
      format.html
      format.json
      format.pdf { send_data KadaikanrisReport.new(@kadaikanris).generate, filename: "kadaikanris.pdf", type: :pdf }
    end
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
        format.html { redirect_to @kadaikanri, notice: "課題が作成されました" }
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
        format.html { redirect_to @kadaikanri, notice: "課題が更新されました", status: :see_other }
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
      format.html { redirect_to kadaikanris_path, notice: "課題が削除されました", status: :see_other }
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
      params.expect(kadaikanri: [ :no, :entrydate, :reporter, :location, :content, :plan, :status_id, :updated_at, :page, :limit])
    end
end
