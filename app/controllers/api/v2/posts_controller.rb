module Api
  module V2
    class PostsController < PostsBaseController
      def index
        page_number = params[:page]
        sort_method = params[:order]
        query_string = params[:query]
        render json: Post.processing(page_number, sort_method, query_string)
      end
    end
  end
end
