require 'test_helper'

module V1
  class PostsUpdateTest < ActionDispatch::IntegrationTest
    setup do
      @post = Post.last
      @new_title = 'New title'
      put "/api/posts/#{@post.id}", headers: { 'Authorization': authenticated_header, 'Accept': 'application/v1' },
        params: { post: { title: @new_title } }
    end

    test 'update action should return correct status on request' do
      assert_response :success
    end

    test 'update action should change the title' do
      new_title = Post.last.title
      assert_equal @new_title, new_title
    end
  end
end
