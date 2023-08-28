require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get entries_index_url
    assert_response :success
  end

end
