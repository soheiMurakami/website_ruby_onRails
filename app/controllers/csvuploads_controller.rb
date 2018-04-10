class CsvuploadsController < ApplicationController
  before_action :set_csvupload, only: [:show, :edit, :update, :destroy]

  # GET /csvuploads
  # GET /csvuploads.json
  def index
    @csvuploads = Csvupload.all
  end

  # GET /csvuploads/1
  # GET /csvuploads/1.json
  def show
  end

  # GET /csvuploads/new
  def new
    @csvupload = Csvupload.new
  end

  # GET /csvuploads/1/edit
  def edit
  end

  # POST /csvuploads
  # POST /csvuploads.json
  def create
    @csvupload = Csvupload.new(csvupload_params)

    respond_to do |format|
      if @csvupload.save
        format.html { redirect_to @csvupload, notice: 'Csvupload was successfully created.' }
        format.json { render :show, status: :created, location: @csvupload }
      else
        format.html { render :new }
        format.json { render json: @csvupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csvuploads/1
  # PATCH/PUT /csvuploads/1.json
  def update
    respond_to do |format|
      if @csvupload.update(csvupload_params)
        format.html { redirect_to @csvupload, notice: 'Csvupload was successfully updated.' }
        format.json { render :show, status: :ok, location: @csvupload }
      else
        format.html { render :edit }
        format.json { render json: @csvupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csvuploads/1
  # DELETE /csvuploads/1.json
  def destroy
    @csvupload.destroy
    respond_to do |format|
      format.html { redirect_to csvuploads_url, notice: 'Csvupload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import 
    Csvupload.import(params[:file])
    redirect_to csvuploads_path, notice: "you did it"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csvupload
      @csvupload = Csvupload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csvupload_params
      params.require(:csvupload).permit(:name, :rating, :description)
    end
end
