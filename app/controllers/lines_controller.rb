class LinesController < ApplicationController

    def create
        #if the line doesnt exist create it
        if params[:line_type]==="moneyline"
            line=Line.find_or_create_by(opponent: params[:opponent], team: params[:team], line_type: params[:line_type], odds: params[:odds], result: "pending" )
        else 
            line=Line.find_or_create_by(opponent: params[:opponent], team: params[:team], line_type: params[:line_type], odds: params[:odds], spread: params[:spread], result: "pending" )
        end
        #create betlines to associate each line to the correct bet instance
        BetLine.create(line_id: line.id, bet_id: params[:bet_id])       
        #add 1 to bet's legs_left attribute for each line associated with bet instance
        bet=Bet.find(params[:bet_id])
        length=bet.lines.length 
        bet.update(legs_left: length)
    
         
    end 

    def matchup_lines
        lines=Line.where(team: params[:team])
        render json: lines
    end

    def update 
        #update line's result
        line=Line.find(params[:id])
        line.update(result: params[:result])
        #render bets associated with this line to possibly be graded as well
        render json: {line: line, bets: line.bets}
    end 

  
end
