require 'test_helper'

class ServiceContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_content = service_contents(:one)
  end

  test "should get index" do
    get service_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_service_content_url
    assert_response :success
  end

  test "should create service_content" do
    assert_difference('ServiceContent.count') do
      post service_contents_url, params: { service_content: { service_id: @service_content.service_id, text1: @service_content.text1, text2: @service_content.text2, text3: @service_content.text3 } }
    end

    assert_redirected_to service_content_url(ServiceContent.last)
  end

  test "should show service_content" do
    get service_content_url(@service_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_content_url(@service_content)
    assert_response :success
  end

  test "should update service_content" do
    patch service_content_url(@service_content), params: { service_content: { service_id: @service_content.service_id, text1: @service_content.text1, text2: @service_content.text2, text3: @service_content.text3 } }
    assert_redirected_to service_content_url(@service_content)
  end

  test "should destroy service_content" do
    assert_difference('ServiceContent.count', -1) do
      delete service_content_url(@service_content)
    end

    assert_redirected_to service_contents_url
  end
end
