class BetsController < ApplicationController

    def create
        bet=Bet.create(user_id: params[:user_id], bet_type: params[:bet_type], odds: params[:odds], current_odds: params[:odds], risk: params[:risk], wins: params[:wins], legs_left: 0, atleast_one_winner: "false", atleast_one_push: "false", result: "pending")
        #update user balance
        user=User.find(params[:user_id])
        user.update(balance: user.balance-params[:risk].to_i)
        render json: bet 
    end 

    def lines
        bet=Bet.find(params[:id])
        render json: bet.lines
    end

    def update
        bet=Bet.find(params[:id])
        #if all legs of the bet are settled and won/pushed update the result of the bet and update the user's balance with winnings
        if params[:result]==="won"
            bet.update(result: params[:result], legs_left: 0, wins: params[:wins], current_odds: params[:current_odds])
            new_balance=bet.user.balance+params[:return]
            bet.user.update(balance: new_balance)

        ##if bet isnt settled yet update legs_left and wins incase one of the lines resulted in a push
        elsif params[:result]==="pending"
            bet.update(legs_left: params[:legs_left], wins: params[:wins], current_odds: params[:current_odds], atleast_one_push: params[:atleast_one_push], atleast_one_winner: params[:atleast_one_winner])

        elsif params[:result]==="push"
            bet.update(result: params[:result], legs_left: 0, wins: params[:wins], atleast_one_winner: params[:atleast_one_winner], atleast_one_push: "true")
            #return the risked amount to the user's balance
            new_balance=bet.user.balance+params[:return]
            bet.user.update(balance: new_balance)

        ##if bet is lost 
        else 
            bet.update(result: params[:result], legs_left:0)
        end
    end
end
