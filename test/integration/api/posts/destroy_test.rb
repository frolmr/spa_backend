require 'test_helper'

class PostsDestroyTest < ActionDispatch::IntegrationTest
  setup do
    @post = Post.last
  end

  test 'destroy action should return correct status on request' do
    delete "/api/posts/#{@post.id}", headers: authenticated_header
    assert_response :success
  end

  test 'destroy action should decrease number of records' do
    assert_difference 'Post.count', -1 do
      delete "/api/posts/#{@post.id}", headers: authenticated_header
    end
  end
end
