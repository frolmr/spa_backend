require 'test_helper'

module V1
  class PostsShowTest < ActionDispatch::IntegrationTest
    setup do
      @response_body = Post.first
      @fields_array = [:title, :body, :username]
      get "/api/posts/#{@response_body.id}", headers: { 'Authorization': authenticated_header, 'Accept': 'application/v1' }
    end

    test 'show action should return correct status on request' do
      assert_response :success
    end

    test 'show action should return an instance of post' do
      assert_equal(response.body, @response_body.to_json)
    end

    test 'show action should return post element with correct fields' do
      @fields_array.each do |el|
        assert_equal true, JSON.parse(response.body).key?(el.to_s)
      end
    end

    test 'show action should return correct fields values' do
      @fields_array.each do |el|
        assert_equal @response_body[el], JSON.parse(response.body)[el.to_s]
      end
    end
  end
end
