module Api
  module V2
    class PostsController < PostsBaseController
      def index
        page_number, sort_method, query_string = params.values_at(:page, :order, :query)
        render json: Post.get_according_request(page_number, sort_method, query_string)
      end

      def create
        super
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :username, :remote_image_url)
      end
    end
  end
end
