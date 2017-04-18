require 'test_helper'

class PostsCreateTest < ActionDispatch::IntegrationTest
  test 'create action should return correct status on request' do
    post '/api/posts', params: { post: { title: 'test_test',
                                         body: 'Hello, I am Vasya',
                                         username: 'vasya' } }
    assert_response :success
  end

  test 'create action should create record with correct values' do
    title = 'Sith'
    body = 'You underestimate the power of the dark side'
    username = 'Dart Vader'
    post '/api/posts', params: { post: { title: title,
                                         body: body,
                                         username: username } }
    created_post = Post.last
    assert_equal title, created_post.title
    assert_equal body, created_post.body
    assert_equal username, created_post.username
  end

  test 'create action should increae number of post records' do
    assert_difference 'Post.count', 1 do
      post '/api/posts', params: { post: { title: 'star_wars',
                                           body: 'May the Force be with you',
                                           username: 'Obi-Wan' } }
    end
  end
end
