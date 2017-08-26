module Api
  module V2
    class PostsController < PostsBaseController
      def index
        render json: {
          posts: paginated(params[:page], params[:sort]),
          total_pages: Post.page(1).total_pages
        }
      end

      private

      def paginated(page_number, sort_method)
        sort_methods = [:created_at]
        method_chain = []
        method_chain << [:page, page_number] if page_number ||= 1
        method_chain << [:order, sort_method.to_sym] if sort_methods.include? sort_method
        method_chain.inject(Post.all) { |object, method_and_args| object.send(*method_and_args) }
      end
    end
  end
end
