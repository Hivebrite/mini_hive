class MediaCenter::FilesController < ApplicationController
  before_action :set_media_center_file, only: %i[show edit update destroy]

  # GET /media_center/files or /media_center/files.json
  def index
    @media_center_files = MediaCenter::File.all
    @display_mode = OpenStruct.new(thumbnail?: true)
  end

  # GET /media_center/files/1 or /media_center/files/1.json
  def show
    @display_mode = OpenStruct.new(thumbnail?: false)
  end

  # GET /media_center/files/new
  def new
    @media_center_file = MediaCenter::File.new
  end

  # GET /media_center/files/1/edit
  def edit; end

  # POST /media_center/files or /media_center/files.json
  def create
    @media_center_file = MediaCenter::File.new(media_center_file_params)

    respond_to do |format|
      if @media_center_file.save
        format.html { redirect_to media_center_file_url(@media_center_file), notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @media_center_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @media_center_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_center/files/1 or /media_center/files/1.json
  def update
    respond_to do |format|
      if @media_center_file.update(media_center_file_params)
        format.html { redirect_to media_center_file_url(@media_center_file), notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @media_center_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @media_center_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_center/files/1 or /media_center/files/1.json
  def destroy
    @media_center_file.destroy

    respond_to do |format|
      format.html { redirect_to media_center_files_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_media_center_file
    @media_center_file = MediaCenter::File.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def media_center_file_params
    params.require(:media_center_file).permit(:name, :url)
  end
end
