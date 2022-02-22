class HomeController < ApplicationController
  def index
    if user_signed_in?
      @campaigns = Campaign.left_outer_joins(:campaign_members).where("campaign_members.user_id=? or campaigns.user_id=?",current_user.id,current_user.id)
    end
  end
end
