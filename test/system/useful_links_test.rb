require "application_system_test_case"

class UsefulLinksTest < ApplicationSystemTestCase
  setup do
    @useful_link = useful_links(:one)
  end

  test "visiting the index" do
    visit useful_links_url
    assert_selector "h1", text: "Useful links"
  end

  test "should create useful link" do
    visit useful_links_url
    click_on "New useful link"

    fill_in "Campaign", with: @useful_link.campaign_id
    fill_in "Name", with: @useful_link.name
    fill_in "Url", with: @useful_link.url
    fill_in "User", with: @useful_link.user_id
    click_on "Create Useful link"

    assert_text "Useful link was successfully created"
    click_on "Back"
  end

  test "should update Useful link" do
    visit useful_link_url(@useful_link)
    click_on "Edit this useful link", match: :first

    fill_in "Campaign", with: @useful_link.campaign_id
    fill_in "Name", with: @useful_link.name
    fill_in "Url", with: @useful_link.url
    fill_in "User", with: @useful_link.user_id
    click_on "Update Useful link"

    assert_text "Useful link was successfully updated"
    click_on "Back"
  end

  test "should destroy Useful link" do
    visit useful_link_url(@useful_link)
    click_on "Destroy this useful link", match: :first

    assert_text "Useful link was successfully destroyed"
  end
end
