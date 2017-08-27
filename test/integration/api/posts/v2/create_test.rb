require 'test_helper'

module V2
  class PostsCreateTest < ActionDispatch::IntegrationTest
    setup do
      @image_url = 'http://tesimages.com/testimage.jpg'
    end

    test 'create action without image url should create post with nil image url' do
      post '/api/posts', headers: { 'Authorization': authenticated_header},
        params: { post: { title: 'post without image' } }
      assert_nil Post.last.image.url
    end

    test 'create action with image url should create post with image url' do
      post '/api/posts', headers: { 'Authorization': authenticated_header},
        params: { post: { remote_image_url: @image_url } }
      assert_not_nil Post.last.image.url
    end
  end
end
