require 'test_helper'

module V2
  class SortingTest < ActionDispatch::IntegrationTest
    test 'posts sorted correctly' do
      new_date = Post.first.created_at += 1.day
      Post.first.update!(created_at: new_date)
      last_page_number = Post.page(1).total_pages
      get '/api/posts', params: { page: last_page_number, sort: 'created_at' }, headers: { 'Authorization': authenticated_header }
      assert_equal Post.first.id, JSON.parse(response.body)['posts'].last['id']
    end
  end
end
