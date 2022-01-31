require "test_helper"

class UsefulLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @useful_link = useful_links(:one)
  end

  test "should get index" do
    get useful_links_url
    assert_response :success
  end

  test "should get new" do
    get new_useful_link_url
    assert_response :success
  end

  test "should create useful_link" do
    assert_difference("UsefulLink.count") do
      post useful_links_url, params: { useful_link: { campaign_id: @useful_link.campaign_id, name: @useful_link.name, url: @useful_link.url, user_id: @useful_link.user_id } }
    end

    assert_redirected_to useful_link_url(UsefulLink.last)
  end

  test "should show useful_link" do
    get useful_link_url(@useful_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_useful_link_url(@useful_link)
    assert_response :success
  end

  test "should update useful_link" do
    patch useful_link_url(@useful_link), params: { useful_link: { campaign_id: @useful_link.campaign_id, name: @useful_link.name, url: @useful_link.url, user_id: @useful_link.user_id } }
    assert_redirected_to useful_link_url(@useful_link)
  end

  test "should destroy useful_link" do
    assert_difference("UsefulLink.count", -1) do
      delete useful_link_url(@useful_link)
    end

    assert_redirected_to useful_links_url
  end
end
