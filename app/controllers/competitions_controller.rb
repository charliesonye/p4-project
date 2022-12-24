class CompetitionsController < ApplicationController
    before_action :authorize

    def index
        competitions = Competition.all
        render json: competitions, include: :teams
    end
    
    def show
        competition = Competition.find_by(id: params[:id])
        render json: competition, include: :teams
    end

    def create
        user = User.find_by(id: session[:user_id])
        competition = user.competitions.create({name: params[:name]})
        render json: competition
    end

    def update     
        user = User.find_by(id: session[:user_id])
        competition = Competition.find_by(id: params[:id])
        competition.update(name: params[:name])
        render json: competition

        
    end
    # def update
    #     user = User.find_by(id: session[:user_id])
    #     competition = Competition.find_by(id: params[:id])
    #     if user.competition
    #         competition.update(name: params[:name])
    #         render json: competition
    #     else
    #         render json: error: {"Not Authorized"}, status: :unauthorized
    #     end
    # end

    def destroy
        competition = Competition.find_by(id: params[:id])
        competition.destroy
        head :no_content
    end

  

   
   
end
