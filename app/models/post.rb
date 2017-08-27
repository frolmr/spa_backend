class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader

  include PgSearch

  pg_search_scope :search_by_title,
                  against: :title,
                  using: { tsearch: { prefix: true, any_word: true } }

  def self.get_according_request(page_number, sort_method, query_string)
    result_posts = get_by_params(page_number, sort_method, query_string)
    total_pages = result_posts.page(1).total_pages
    {
      posts: result_posts,
      total_pages: total_pages
    }
  end

  def self.get_by_params(page_number, sort_method, query_string)
    sort_methods = [:created_at]
    method_chain = []
    method_chain << [:page, page_number] if page_number ||= 1
    method_chain << [:order, sort_method.to_sym] if sort_methods.include? sort_method
    method_chain << [:search_by_title, query_string] if query_string
    method_chain.inject(Post.all) { |object, method_and_args| object.send(*method_and_args) }
  end
end
