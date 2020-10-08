class SessionsController < ApplicationController

    def create 
        @user = User.find_by(username: params[:username])

        if @user == nil 
            render json: {error: "Sorry, user with that username does not exist"}
        else 
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id
                render json: {user: @user}
            else 
                render json: {error: "Sorry, user with that password does not exist"}
            end
        end 
    end 

    def destroy 
        reset_session 
    end  
end 

