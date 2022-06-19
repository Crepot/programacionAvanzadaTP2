module Api
    module V1
        class PlayerHandController < ApplicationController
            include ActionController::HttpAuthentication::Token

            before_action :authentication
            before_action :set_player  

            def index
                @player_hand = PlayerHand.all
                render status:200, json:{player_hand: @player_hand}
            end

            def create
                #TODO:Ver la lógica que lleva esto
            end

            def show
                render status:200, json:{player_hand:@player_hand}
            end

            def update
                if @player_hand.update(player_Hand_params)
                    render status:200, json:{player_hand:@player_hand}
                else
                    render status:400, json:{messaje:@player_hand.errors.details}
                end
            end

            def destroy
                if @player_hand.destroy!
                    render status:200, json:{messaje: "player hand deleted"}
                else
                    render status:400, json:{messaje:@player_hand.errors.details}
                end
            end



            private
            #Strong params
            def player_Hand_params
                params.require(:player_hand).permit(:card1,:card2,:card3,:score_hand)
            end

            def set_player
                @player = Player.find_by(id: authenticate_player)
                if @player.nil?
                   return head :unauthorized
                end
                return @player            
            end

            def set_player_had
                @player_hand = PlayerHand.find_by(id:params[:id])
                if player_hand.nil?
                    render status:400, json:{messaje:"player_hand not found #{params[:id]}"}
                    false
                end
            end

            def authentication
                return authenticate_player
            end
        end
    end
end
