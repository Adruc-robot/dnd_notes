require "test_helper"

class CampaignMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_member = campaign_members(:one)
  end

  test "should get index" do
    get campaign_members_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_member_url
    assert_response :success
  end

  test "should create campaign_member" do
    assert_difference("CampaignMember.count") do
      post campaign_members_url, params: { campaign_member: { campaign_id: @campaign_member.campaign_id, user_id: @campaign_member.user_id } }
    end

    assert_redirected_to campaign_member_url(CampaignMember.last)
  end

  test "should show campaign_member" do
    get campaign_member_url(@campaign_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_member_url(@campaign_member)
    assert_response :success
  end

  test "should update campaign_member" do
    patch campaign_member_url(@campaign_member), params: { campaign_member: { campaign_id: @campaign_member.campaign_id, user_id: @campaign_member.user_id } }
    assert_redirected_to campaign_member_url(@campaign_member)
  end

  test "should destroy campaign_member" do
    assert_difference("CampaignMember.count", -1) do
      delete campaign_member_url(@campaign_member)
    end

    assert_redirected_to campaign_members_url
  end
end
