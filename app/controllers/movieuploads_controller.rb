class MovieuploadsController < ApplicationController
  before_action :set_movieupload, only: [:show, :edit, :update, :destroy]

  # GET /movieuploads
  # GET /movieuploads.json
  def index
    @movieuploads = Movieupload.all
  end

  # GET /movieuploads/1
  # GET /movieuploads/1.json
  def show
  end

  # GET /movieuploads/new
  def new
    @movieupload = Movieupload.new
  end

  # GET /movieuploads/1/edit
  def edit
  end

  # POST /movieuploads
  # POST /movieuploads.json
  def create
    @movieupload = Movieupload.new(movieupload_params)

    respond_to do |format|
      if @movieupload.save
        format.html { redirect_to @movieupload, notice: 'Movieupload was successfully created.' }
        format.json { render :show, status: :created, location: @movieupload }
      else
        format.html { render :new }
        format.json { render json: @movieupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movieuploads/1
  # PATCH/PUT /movieuploads/1.json
  def update
    respond_to do |format|
      if @movieupload.update(movieupload_params)
        format.html { redirect_to @movieupload, notice: 'Movieupload was successfully updated.' }
        format.json { render :show, status: :ok, location: @movieupload }
      else
        format.html { render :edit }
        format.json { render json: @movieupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movieuploads/1
  # DELETE /movieuploads/1.json
  def destroy
    @movieupload.destroy
    respond_to do |format|
      format.html { redirect_to movieuploads_url, notice: 'Movieupload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movieupload
      @movieupload = Movieupload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movieupload_params
      params.require(:movieupload).permit(:name, :rating, :description)
    end
end
