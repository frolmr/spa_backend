require 'test_helper'

module V1
  class PostsIndexTest < ActionDispatch::IntegrationTest
    setup do
      get '/api/posts', headers: { 'Authorization': authenticated_header, 'Accept': 'application/v1' }
    end

    test 'index action should return correct status on request' do
      assert_response :success
    end

    test 'index action should return an array' do
      assert_instance_of(Array, JSON.parse(response.body))
    end

    test 'index action should return array of all elements' do
      assert_equal Post.all.count , JSON.parse(response.body).length
    end
  end
end
