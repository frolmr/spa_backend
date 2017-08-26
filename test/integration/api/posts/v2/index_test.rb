require 'test_helper'

module V2
  class PostsIndexTest < ActionDispatch::IntegrationTest
    setup do
      get '/api/posts', headers: { 'Authorization': authenticated_header }
    end

    test 'index action should return correct status on request' do
      assert_response :success
    end

    test 'index action should return a hash' do
      assert_instance_of(Hash, JSON.parse(response.body))
    end

    test 'index action should return array of poste inside hash' do
      assert_instance_of(Array, JSON.parse(response.body)['posts'])
    end
  end
end
