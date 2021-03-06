module Api
  module V2
    class PostsController < PostsBaseController
      def index
        result = Post.page(params[:page]).order(params[:order])
        result = result.search_by_title(params[:query]) if params[:query]
        render json: { posts: result, pages: { total_pages: result.total_pages, current_page: result.current_page } }
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
