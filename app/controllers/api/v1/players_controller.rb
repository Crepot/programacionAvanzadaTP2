module Api
    module V1
        class PlayersController < ApplicationController
            include ActionController::HttpAuthentication::Token

            before_action :authentication, only: [:show, :update, :destroy,:assigned]
            before_action :set_player, only: [:show, :update, :destroy]


            def index
                @players = Player.all

                return render status:200, json:{player_id: @players.id}
            end

            def create
                @player = Player.new(player_params)
                if @player.save 
                    render status:200, json:{player:@player}
                else
                    render status:400, json:{messaje:@player.errors.details}
                end
            end

            def show
                render status:200, json:{player:@player} 
            end

            def update
                if @player.update(playerParams)
                    render status:200, json:{player:@player}
                else
                    render status:400, json:{messaje:@player.errors.details}
                end
            end

            def destroy
                if @player.destroy
                    render status:200, json:{messaje: "player deleted"}
                else
                    render status:400, json:{messaje:@player.errors.details}
                end
            end


            private
            #Strong params
            def player_params
                #TODO: 
                params.require(:player).permit(:name,:email,:password,:tokenAuth,:sessionActive,:team,:score)
            end

            def set_player
                @player = Player.find_by(id: authenticate_player)
                if @player.nil?
                   return head :unauthorized
                end
                return @player
            end

            def authentication
                return authenticate_player
            end
        end
    end
end
