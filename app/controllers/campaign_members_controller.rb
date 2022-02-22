class CampaignMembersController < ApplicationController
  before_action :get_campaign
  before_action :set_campaign_member, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :create]

  # GET /campaign_members or /campaign_members.json
  def index
    #@campaign_members = @campaign.campaign_members.where("campaigns.user_id=?",current_user.id)
    @campaign_members = @campaign.campaign_members.where("campaign_members.user_id=?",current_user.id)
  end

  # GET /campaign_members/1 or /campaign_members/1.json
  def show
  end

  # GET /campaign_members/new
  def new
    #@campaign_member = CampaignMember.new
    #@userList = users.select("users.email,users.id").joins("left join campaign_members on users.id=campaign_members.user_id").where("campaign_members.user_id is null")
    #@userList = Users.all.joins("left join campaign_members on Users.id=campaign_members.user_id").where("campaign_members.user_id is null").select("Users.email,Users.id")
    #@userList = User.left_outer_joins(:campaign_members).select("distinct users.email,users.id").where("campaign_members.user_id is null")
    @userList = User.left_outer_joins(:campaign_members).select("distinct users.email,users.id").where("campaign_members.campaign_id is null or campaign_members.campaign_id<>?",@campaign.id)
    @campaign_member = @campaign.campaign_members.build
  end

  # GET /campaign_members/1/edit
  def edit
  end

  # POST /campaign_members or /campaign_members.json
  def create
    #@campaign_member = CampaignMember.new(campaign_member_params)
    @campaign_member = @campaign.campaign_members.build(campaign_member_params)

    respond_to do |format|
      if @campaign_member.save
        #format.html { redirect_to campaign_member_url(@campaign_member), notice: "Campaign member was successfully created." }
        format.html { redirect_to campaign_path(@campaign), notice: "Campaign member was successfully created." }
        format.json { render :show, status: :created, location: @campaign_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_members/1 or /campaign_members/1.json
  def update
    respond_to do |format|
      if @campaign_member.update(campaign_member_params)
        #format.html { redirect_to campaign_member_url(@campaign_member), notice: "Campaign member was successfully updated." }
        format.html { redirect_to campaigh_path(@campaign), notice: "Campaign member was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_members/1 or /campaign_members/1.json
  def destroy
    @campaign_member.destroy

    respond_to do |format|
      #format.html { redirect_to campaign_members_url, notice: "Campaign member was successfully destroyed." }
      format.html { redirect_to campaign_campaign_members_path(@campaign), notice: "Campaign member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
    def correct_user  
      #only the owner of the campaign can update the campaign members - this check should be based on the campaign itself
      @campaignCheck = current_user.campaigns.find_by(id: @campaign.id)
      #send back to the campaign
      #redirect_to campaign_campaign_members_path, notice: "Not authorized!" if @campaignCheck.nil?
      redirect_to campaign_url(@campaign), notice: "Not authorized!" if @campaignCheck.nil?
    end


    def set_campaign_member
      @campaign_member = @campaign.campaign_members.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_member_params
      params.require(:campaign_member).permit(:user_id, :campaign_id)
    end
end
