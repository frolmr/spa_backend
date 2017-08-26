module Api
  class PostsBaseController < ApplicationController
    before_action :authenticate_user
    before_action :set_post, only: [:show, :update, :destroy]

    def index
      render json: Post.all
    end

    def show
      render json: @post
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        render json: @post
      else
        render json: { errors: @post.errors, status: :unprocessable_entity }
      end
    end

    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: { errors: @post.errors, status: :unprocessable_entity }
      end
    end

    def destroy
      @post.destroy
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:id, :title, :body, :username)
    end
  end
end
