module Api
    module V1
        class GameController < ApplicationController
            include ActionController::HttpAuthentication::Token
            before_action :authentication

            private


            #Strong params
            def game_params
                #TODO: 
                params.require().permit()
            end

            def authentication
                return authenticate_player
            end
        end
    end
end
