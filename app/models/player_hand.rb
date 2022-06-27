class PlayerHand < ApplicationRecord
    belongs_to :game
    belongs_to :player
    has_many :plyerHandCards, dependent: :destroy

    enum truco: { vale4:3,retruco:2 ,truco:1 , no_truco:0}
    enum envido: { falta_envido:3,real_envido:2 ,envido:1 , no_envido:0}

    before_create :default_values 

    def default_values
        self.truco = 0
        self.envido = 0
        self.score_hand = 0
    end  

    def cantar_truco
        #Tengo que checkear que:
        #   - El jugador que canta puede hacerlo en su turno                  
        #   - 
    end

    
    def cantar_evido
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
