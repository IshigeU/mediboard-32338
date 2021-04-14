require 'test_helper'

class DrugHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drug_history_index_url
    assert_response :success
  end

end
