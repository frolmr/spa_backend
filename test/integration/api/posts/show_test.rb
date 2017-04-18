require 'test_helper'

class PostsShowTest < ActionDispatch::IntegrationTest
  setup do
    @response_body = Post.first
    get "/api/posts/#{@response_body.id}"
  end

  test 'show action should return correct status on request' do
    assert_response :success
  end

  test 'show action should return an instance of post' do
    assert_equal(response.body, @response_body.to_json)
  end

  test 'show action should return post element with correct fields' do
    assert_equal true, JSON.parse(response.body).key?('id')
    assert_equal true, JSON.parse(response.body).key?('title')
    assert_equal true, JSON.parse(response.body).key?('body')
    assert_equal true, JSON.parse(response.body).key?('username')
  end

  test 'show action should return correct fields values' do
    assert_equal @response_body.id, JSON.parse(response.body)['id']
    assert_equal @response_body.title, JSON.parse(response.body)['title']
    assert_equal @response_body.body, JSON.parse(response.body)['body']
    assert_equal @response_body.username, JSON.parse(response.body)['username']
  end
end
