json.extract! campaign_member, :id, :user_id, :campaign_id, :created_at, :updated_at
json.url campaign_member_url(campaign_member, format: :json)
