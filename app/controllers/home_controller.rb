class HomeController < ApplicationController
  def index
    if user_signed_in?
      @campaigns = current_user.campaigns.all
    end
  end
end
