class PlayerHand < ApplicationRecord
    belongs_to :game
    belongs_to :player
    has_many :player_hand_cards, dependent: :destroy

    def truco
        #Tengo que checkear que:
        #   - El jugador que canta puede hacerlo en su turno                  
        #   - 
    end

    
    def evido
        #Tengo que checkear que:
        #   - El jugador que canta puede hacerlo en su turno                  
        #   - que se hace durante la primera vuelta de la ronda
        #   - 
    end

    def check_evido #Una vez que finalizan las 3 rondas checkeamos quien ganó los puntos
        #Tengo que checkear que:
        #   - El jugador que canta puede hacerlo en su turno                  
        #   - que se hace durante la primera vuelta de la ronda
        #   - 
    end

    def check_truco #Una vez que finalizan las 3 rondas checkeamos quien ganó los puntos
        #Tengo que checkear que:
        #   - El jugador que canta puede hacerlo en su turno                  
        #   - 
    end

    def mazo
        #El jugador se va al mazo, le suma 1 punto al otro player_hand y se tiene que chekear el envido y el truco
    end

end
