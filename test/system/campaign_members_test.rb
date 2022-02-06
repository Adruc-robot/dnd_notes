require "application_system_test_case"

class CampaignMembersTest < ApplicationSystemTestCase
  setup do
    @campaign_member = campaign_members(:one)
  end

  test "visiting the index" do
    visit campaign_members_url
    assert_selector "h1", text: "Campaign members"
  end

  test "should create campaign member" do
    visit campaign_members_url
    click_on "New campaign member"

    fill_in "Campaign", with: @campaign_member.campaign_id
    fill_in "User", with: @campaign_member.user_id
    click_on "Create Campaign member"

    assert_text "Campaign member was successfully created"
    click_on "Back"
  end

  test "should update Campaign member" do
    visit campaign_member_url(@campaign_member)
    click_on "Edit this campaign member", match: :first

    fill_in "Campaign", with: @campaign_member.campaign_id
    fill_in "User", with: @campaign_member.user_id
    click_on "Update Campaign member"

    assert_text "Campaign member was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign member" do
    visit campaign_member_url(@campaign_member)
    click_on "Destroy this campaign member", match: :first

    assert_text "Campaign member was successfully destroyed"
  end
end
