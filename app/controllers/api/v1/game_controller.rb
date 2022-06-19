module Api
    module V1
        class GameController < ApplicationController
            include ActionController::HttpAuthentication::Token

            before_action :authentication
            before_action :set_player  
            def index
                #TODO:
                @games = Game.all
                return render status:200, json:{games: @games}
            end

            def create
                #TODO:Ver que lógica lleva esto
            end

            def show
                #TODO:
                render status:200, json:{game:@game} 
            end

            def update
                if @game.update(game_params)
                    render status:200, json:{game:@game}
                else
                    render status:400, json:{messaje:@game.errors.details}
                end
            end

            def destroy
                if @game.destroy
                    render status:200, json:{messaje: "game deleted"}
                else
                    render status:400, json:{messaje:@game.errors.details}
                end
            end


            private


            #Strong params
            def game_params
                params.require(:game).permit(:winner,:curret_player,:current_hand)
            end


            def set_player
                @player = Player.find_by(id: authenticate_player)
                if @player.nil?
                   return head :unauthorized
                end
                return @player
            end

            def set_game
                @game = Game.find_by(id:params[:id])
                if @game.nil?
                    return head :unauthorized
                 end
                 return @game
            end

            def authentication
                return authenticate_player
            end
        end
    end
end
