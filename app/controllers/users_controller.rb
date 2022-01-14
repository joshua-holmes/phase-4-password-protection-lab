class UsersController < ApplicationController

    def create
        user = User.create! user_params
        if user.password == user.password_confirmation
            session[:user_id] ||= user.id
            render json: user
        else
            raise ActiveRecord::RecordInvalid
        end
    end

    def show
        if session.include? :user_id
            user = User.find(session[:user_id])
            render json: user
        else
            render json: { error: "Not Authorized" }, status: :unauthorized
        end
        
    end

    private

    def user_params
        params.permit :username, :password, :password_confirmation
    end

end
