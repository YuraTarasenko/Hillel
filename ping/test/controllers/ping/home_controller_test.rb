require 'test_helper'

module Ping
  class HomeControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get home_index_url
      assert_response :success
    end

  end
end
