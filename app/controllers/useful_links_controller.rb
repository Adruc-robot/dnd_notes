class UsefulLinksController < ApplicationController
  before_action :set_useful_link, only: %i[ show edit update destroy ]

  # GET /useful_links or /useful_links.json
  def index
    @useful_links = UsefulLink.all
  end

  # GET /useful_links/1 or /useful_links/1.json
  def show
  end

  # GET /useful_links/new
  def new
    @useful_link = UsefulLink.new
  end

  # GET /useful_links/1/edit
  def edit
  end

  # POST /useful_links or /useful_links.json
  def create
    @useful_link = UsefulLink.new(useful_link_params)

    respond_to do |format|
      if @useful_link.save
        format.html { redirect_to useful_link_url(@useful_link), notice: "Useful link was successfully created." }
        format.json { render :show, status: :created, location: @useful_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @useful_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /useful_links/1 or /useful_links/1.json
  def update
    respond_to do |format|
      if @useful_link.update(useful_link_params)
        format.html { redirect_to useful_link_url(@useful_link), notice: "Useful link was successfully updated." }
        format.json { render :show, status: :ok, location: @useful_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @useful_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /useful_links/1 or /useful_links/1.json
  def destroy
    @useful_link.destroy

    respond_to do |format|
      format.html { redirect_to useful_links_url, notice: "Useful link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useful_link
      @useful_link = UsefulLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def useful_link_params
      params.require(:useful_link).permit(:user_id, :campaign_id, :name, :url)
    end
end
