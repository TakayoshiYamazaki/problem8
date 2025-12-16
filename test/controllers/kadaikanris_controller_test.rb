require "test_helper"

class KadaikanrisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kadaikanri = kadaikanris(:one)
  end

  test "should get index" do
    get kadaikanris_url
    assert_response :success
  end

  test "should get new" do
    get new_kadaikanri_url
    assert_response :success
  end

  test "should create kadaikanri" do
    assert_difference("Kadaikanri.count") do
      post kadaikanris_url, params: { kadaikanri: { content: @kadaikanri.content, entrydate: @kadaikanri.entrydate, location: @kadaikanri.location, no: @kadaikanri.no, plan: @kadaikanri.plan, reporter: @kadaikanri.reporter, status_id: @kadaikanri.status_id } }
    end

    assert_redirected_to kadaikanri_url(Kadaikanri.last)
  end

  test "should show kadaikanri" do
    get kadaikanri_url(@kadaikanri)
    assert_response :success
  end

  test "should get edit" do
    get edit_kadaikanri_url(@kadaikanri)
    assert_response :success
  end

  test "should update kadaikanri" do
    patch kadaikanri_url(@kadaikanri), params: { kadaikanri: { content: @kadaikanri.content, entrydate: @kadaikanri.entrydate, location: @kadaikanri.location, no: @kadaikanri.no, plan: @kadaikanri.plan, reporter: @kadaikanri.reporter, status_id: @kadaikanri.status_id } }
    assert_redirected_to kadaikanri_url(@kadaikanri)
  end

  test "should destroy kadaikanri" do
    assert_difference("Kadaikanri.count", -1) do
      delete kadaikanri_url(@kadaikanri)
    end

    assert_redirected_to kadaikanris_url
  end
end
