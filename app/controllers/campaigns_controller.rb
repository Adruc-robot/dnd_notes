class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /campaigns or /campaigns.json
  def index
    #@campaigns = Campaign.all
    #@campaigns = current_user.campaigns.all.order(name: :asc)
    @campaigns = Campaign.left_outer_joins(:campaign_members).where("campaigns.user_id=? or campaign_members.user_id=?",current_user.id,current_user.id).select("distinct campaigns.*")
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
    @testVal = @campaign.notes.distinct.select("category")
    @notes = Note.joins(:campaign).where("campaigns.id=? and (notes.user_id=? or notes.audience =?)",@campaign.id,current_user.id,"All Members").select("notes.*").order("notes.created_at DESC")
    #@links = current_user.useful_links.joins(:campaign).order("useful_links.name")
    #@links = UsefulLink.campaign.current_user.order("useful_links.name")
    @links = UsefulLink.joins(:campaign).where("campaigns.id=? and useful_links.user_id=?",@campaign.id,current_user.id)
  end

  # GET /campaigns/new
  def new
    #@campaign = Campaign.new
    @campaign = current_user.campaigns.build
  end

  # GET /campaigns/1/edit
  def edit
    #@campaign = Campaign.find(params[:id])
  end

  # POST /campaigns or /campaigns.json
  def create
    #@campaign = Campaign.new(campaign_params)
    @campaign = current_user.campaigns.build(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to campaign_url(@campaign), notice: "Campaign was successfully created." }
        #format.html { redirect_to @campaign, notice: "Campaign was successfully created." }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    respond_to do |format|
      #@campaign = Campaign.find(params[:id])

      if @campaign.update(campaign_params)
        format.html { redirect_to campaign_url(@campaign), notice: "Campaign was successfully updated." }
        #format.html { redirect_to @campaign, notice: "Campaign was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    #@campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      #format.html { redirect_to campaigns_url, notice: "Campaign was successfully destroyed." }
      format.html { redirect_to "root_path", notice: "Campaign was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  


  private
    
    def correct_user  
      @campaignCheck = current_user.campaigns.find_by(id: params[:id])
      #redirect_to campaigns_path, notice: "Not authorized!" if @campaignCheck.nil?
      redirect_to campaign_url(@campaign), notice: "Not authorized!" if @campaignCheck.nil?
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:user_id, :name)
    end
end
