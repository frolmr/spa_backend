require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest
  setup do
    get '/api/posts'
  end

  test 'index action should return correct status on request' do
    assert_response :success
  end

  test 'index action should return an array' do
    assert_instance_of(Array, JSON.parse(response.body))
  end

  test 'index action should return array of 3 elements' do
    assert_equal 3, JSON.parse(response.body).length
  end
end
