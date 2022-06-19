module Api
    module V1
        class PlayerHandController < ApplicationController
            include ActionController::HttpAuthentication::Token



            private


            #Strong params
            def plaayer_Hand_params
                #TODO: 
                params.require().permit()
            end

            def authentication
                return authenticate_player
            end
        end
    end
end
