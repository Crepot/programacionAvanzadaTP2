module Api
    module V1
        class GameController < ApplicationController
            include ActionController::HttpAuthentication::Token

            before_action :authentication
            before_action :set_player  
            before_action :set_game, only: [:repartir,:join_game,:update,:show,:destroy,:mostrar_carta]  

            def index
                #TODO:
                @games = Game.all
                return render status:200, json:{games: @games}
            end

            def create
                #TODO:Ver que lógica lleva esto
                @game = Game.new(game_params)
                #TODO: Creo que no hace falta asignar al player acá, lo puedo hacer desde el join_game
                # Con esto me puedo ahorrarasignar el playerHand
                if @player.games && @player.games.length > 0 && @player.games.last.status_game != "finalizado"
                    return render status:400, json:{messaje:"#{@player.name} no puede comenzar un nuevo juego porque se encuentra en un juego en curso" }
                end  
                @player.team = 1;
                !@game.players.push(@player)
                if @game.save
                    player_hand = @player.playerHands.last
                    #debugger
                    player_hand.round_hand = 1
                    if player_hand.save
                        render status:200, json:{game: @game}
                    else
                        render status:400, json:{messaje:player_hand.errors.details}
                    end
                else
                        render status:400, json:{messaje:@game.errors.details}
                end


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

            def repartir
                @game.repartir_cartas
                if @game
                    render status:200, json:{messaje: "se repartieron las cartas"}
                else
                    render status:400, json:{messaje:@game.errors.details}
                end
            end

            def join_game
                #Por cada jugador que se une al juego le creamos un playerHand
                # TODO: Necesito que me pasen el team 2-> Ellos,1-> Nosotros
                # TODO: En esta primera etapa lo hago para 2 players solamente --> le seteo el team 2 directamente
                if @player.games && @player.games.length > 0 && @player.games.last.status_game != "finalizado"
                    return render status:400, json:{messaje:"#{@player.name} no puede unir a un nuevo juego porque se encuentra en un juego en curso" }
                end

               if @game.join @player
                @player.playerHands
                if @game.save
                    render status:200, json:{game: @game}
                else
                    render status:400, json:{messaje:@game.errors.details}
                end
                else
                    render status:400, json:{messaje:@game.errors.details}
                end

            end

            def mostrar_carta
                p "Esto es un post al mostrar carta"
                @game.mostrar
                debugger
                #Acá es la lógica para mostrar la carta del player
                #Verificar que el player es el current
                #Verficar la ronda en la que tira la carta, esto es 1,2 o3
                #Si es la primera solamente mostrarla
                #Si es la segunda vuelta ver que carta es la que se jugo anteriormente y ver cuál gana, según eso dejo tirar
                #Si la segunda es empate, tira el que es mano
                #Checkear si gano la ronda el player que mostro la carta (Con esto me refiero a ver si ya gano 2 rondas)
                #Si es la tercera vuelta verificar lo mismo que en la 2da
            end

            private
            #Strong params
            def game_params
                params.require(:game).permit(:winner,:curret_player,:current_hand,:status_game)
            end


            def set_player
                @player = Player.find_by(id: authenticate_player)
                if @player.nil?
                   return head :unauthorized
                end
                return @player
            end

            def set_game
                p "estoy en el set game"
                @game = Game.find_by(id:params[:game_id])
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
