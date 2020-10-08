class UsersController < ApplicationController

    def create 
        @user = User.create(user_params)

        if @user.valid? == true 
            session[:user_id] = @user.id
            render json:  {userId: @user.id}
        else 
            render json: {errors: @user.errors.full_messages}
        end 
    end 
end
