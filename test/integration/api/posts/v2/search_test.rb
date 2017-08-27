require 'test_helper'

module V2
  class SearchTest < ActionDispatch::IntegrationTest
    setup do
      @first_post = Post.create(title: 'Hello')
      @second_post = Post.create(title: 'Goodbye')
    end

    test 'search request for first post (full) should return first post))) Hello Captain' do
      get '/api/posts', params: { query: 'Hello' }, headers: { 'Authorization': authenticated_header }
      assert_includes(JSON.parse(response.body)['posts'], JSON.parse(@first_post.to_json))
    end

    test 'search request for first post (part) should return first post' do
      get '/api/posts', params: { query: 'Hel' }, headers: { 'Authorization': authenticated_header }
      assert_includes(JSON.parse(response.body)['posts'], JSON.parse(@first_post.to_json))
    end

    test 'search request for second post (full/part) should return second post' do
      get '/api/posts', params: { query: 'Good' }, headers: { 'Authorization': authenticated_header }
      assert_includes(JSON.parse(response.body)['posts'], JSON.parse(@second_post.to_json))
    end

    test 'search request for both posts (full/part) should return both posts' do
      get '/api/posts', params: { query: 'Hel Good' }, headers: { 'Authorization': authenticated_header }
      assert_includes(JSON.parse(response.body)['posts'], JSON.parse(@first_post.to_json))
      assert_includes(JSON.parse(response.body)['posts'], JSON.parse(@second_post.to_json))
    end
  end
end
