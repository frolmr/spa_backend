module Api
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    def index
      render json: Post.all.to_json
    end

    def show
      render json: @post.to_json
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        render json: @post.to_json
      else
        render json: { errors: @post.errors, status: :unprocessable_entity }
      end
    end

    def update
      if @post.update(post_params)
        render json: @post.to_json
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
