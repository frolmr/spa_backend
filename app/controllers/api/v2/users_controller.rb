module Api
  module V2
    class UsersController < ApplicationController
      def show
        render json: current_user
      end

      def update
        if current_user.update(user_params)
          render json: current_user
        else
          render json: { errors: current_user.errors, status: shit_happend }
        end
      end

      private

      def user_params
        params.require(:user).permit(:locale)
      end
    end
  end
end
