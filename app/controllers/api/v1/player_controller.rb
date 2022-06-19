module Api
    module V1
        class PlayerController < ApplicationController
            include ActionController::HttpAuthentication::Token
            private


            #Strong params
            def player_params
                #TODO: 
                params.require().permit()
            end

            def authentication
                return authenticate_player
            end
        end
    end
end
