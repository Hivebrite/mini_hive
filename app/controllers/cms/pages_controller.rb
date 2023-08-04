class Cms::PagesController < ApplicationController
  before_action :set_cms_page, only: %i[show edit update destroy]

  def home
    @cms_page = Cms::Page.first
  end

  # GET /cms/pages or /cms/pages.json
  def index
    @cms_pages = Cms::Page.all
  end

  # GET /cms/pages/1 or /cms/pages/1.json
  def show; end

  # GET /cms/pages/new
  def new
    @cms_page = Cms::Page.new
  end

  # GET /cms/pages/1/edit
  def edit; end

  # POST /cms/pages or /cms/pages.json
  def create
    @cms_page = Cms::Page.new(cms_page_params)

    respond_to do |format|
      if @cms_page.save
        format.html { redirect_to cms_page_url(@cms_page), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @cms_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cms_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cms/pages/1 or /cms/pages/1.json
  def update
    respond_to do |format|
      if @cms_page.update(cms_page_params)
        format.html { redirect_to cms_page_url(@cms_page), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @cms_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cms_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/pages/1 or /cms/pages/1.json
  def destroy
    @cms_page.destroy

    respond_to do |format|
      format.html { redirect_to cms_pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cms_page
    @cms_page = Cms::Page.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cms_page_params
    params.require(:cms_page).permit(:title, :content)
  end
end
