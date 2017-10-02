require 'test_helper'

module V2
  class PaginationTest < ActionDispatch::IntegrationTest
    setup do
      @per_page = Post.page(1).limit_value
      @last_page_number = Post.page(1).total_pages
    end

    test 'last page should contain mod of elements' do
      posts_on_last_page = Post.all.count % @per_page
      get '/api/posts', params: { page: @last_page_number }, headers: { 'Authorization': authenticated_header }
      assert_equal posts_on_last_page, JSON.parse(response.body)['posts'].length
    end

    test 'first page should contain default per_page amount of elements' do
      get '/api/posts', headers: { 'Authorization': authenticated_header }
      assert_equal @per_page, JSON.parse(response.body)['posts'].length
    end

    test 'index response should return correct ammount of pages' do
      get '/api/posts', headers: { 'Authorization': authenticated_header }
      assert_equal @last_page_number, JSON.parse(response.body)['pages']['total_pages']
    end
  end
end
