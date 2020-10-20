class UsersController < ApplicationController
    
    def create 
      
        @user = User.new(username: params[:username], password: params[:password], balance: 0)

        if @user.valid? == true 
            @user.save
            session[:user_id] = @user.id
            render json:  @user
        else 
            render json: {error: @user.errors.full_messages}
        end 
    end 

    def pending_bets
        #used for showing pending bets for current instance of user
        user=User.find(params[:id])
        bets=user.bets.select do |bet| 
            bet.result==="pending"
        end   
        render json: bets
    end

    def past_bets
         #used for showing past bets for current instance of user
        user=User.find(params[:id])
        bets=user.bets.select do |bet| 
            bet.result!="pending"
        end 

        render json: bets
    end

    def update 
        puts params
        user=User.find(params[:userId])
        if params[:password]
            user.update(password:params[:password])
        elsif params[:deposit]
            user.update(balance: user.balance+params[:deposit])
        elsif params[:withdraw]
            user.update(balance: user.balance-params[:withdraw])
        end 
        render json: user
    end 
end
