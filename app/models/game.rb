class Game < ApplicationRecord
    has_many :player_hands, dependent: :destroy
    has_many :players, through: :player_hands

    enum status_game: {finalizado:2 ,jugando:1 , creado:0}

    before_create :default_values

    def default_values
        self.winner = -1
        self.status_game = 0
    end


    #Estos son los palos  => espada:3,basto:2,oro:1,copa:0
    CARDS = [
        #Espada
        {
            number:1,
            palo:3,
            effectiveness:14,
            id:1,
            show:false #Para mostrar la carta o no en el front
        },
        {
            number:2,
            palo:3,
            effectiveness:9,
            id:2,
            show:false

        },
        {
            number:3,
            palo:3,
            effectiveness:10,
            id:3,
            show:false
        },
        {
            number:4,
            palo:3,
            effectiveness:1,
            id:4,
            show:false
        },
        {
            number:5,
            palo:3,
            effectiveness:2,
            id:5,
            show:false
        },
        {
            number:6,
            palo:3,
            effectiveness:3,
            id:6,
            show:false
        },
        {
            number:7,
            palo:3,
            effectiveness:12,
            id:7,
            show:false
        },
        {
            number:10,
            palo:3,
            effectiveness:5,
            id:8,
            show:false
        },
        {
            number:11,
            palo:3,
            effectiveness:6,
            id:9,
            show:false

        },
        {
            number:12,
            palo:3,
            effectiveness:7,
            id:10,
            show:false
        },
        #Basto
        {
            number:1,
            palo:2,
            effectiveness:13,
            id:11,
            show:false
        },
        {
            number:2,
            palo:2,
            effectiveness:9,
            id:12,
            show:false

        },
        {
            number:3,
            palo:2,
            effectiveness:10,
            id:13,
            show:false
        },
        {
            number:4,
            palo:2,
            effectiveness:1,
            id:14,
            show:false
        },
        {
            number:5,
            palo:2,
            effectiveness:2,
            id:15,
            show:false
        },
        {
            number:6,
            palo:2,
            effectiveness:3,
            id:16,
            show:false
        },
        {
            number:7,
            palo:2,
            effectiveness:4,
            id:17,
            show:false
        },
        {
            number:10,
            palo:2,
            effectiveness:5,
            id:18,
            show:false
        },
        {
            number:11,
            palo:2,
            effectiveness:6,
            id:19,
            show:false

        },
        {
            number:12,
            palo:2,
            effectiveness:7,
            id:20,
            show:false
        },
        #Oro
        {
            number:1,
            palo:1,
            effectiveness:8,
            id:21,
            show:false
        },
        {
            number:2,
            palo:1,
            effectiveness:9,
            id:22,
            show:false

        },
        {
            number:3,
            palo:1,
            effectiveness:10,
            id:23,
            show:false
        },
        {
            number:4,
            palo:1,
            effectiveness:1,
            id:24,
            show:false
        },
        {
            number:5,
            palo:1,
            effectiveness:2,
            id:25,
            show:false
        },
        {
            number:6,
            palo:1,
            effectiveness:3,
            id:26,
            show:false
        },
        {
            number:7,
            palo:1,
            effectiveness:11,
            id:27,
            show:false
        },
        {
            number:10,
            palo:1,
            effectiveness:5,
            id:28,
            show:false
        },
        {
            number:11,
            palo:1,
            effectiveness:6,
            id:29,
            show:false

        },
        {
            number:12,
            palo:1,
            effectiveness:7,
            id:30,
            show:false
        },
        #Copa
        {
            number:1,
            palo:0,
            effectiveness:8,
            id:31,
            show:false
        },
        {
            number:2,
            palo:2,
            effectiveness:9,
            id:32,
            show:false

        },
        {
            number:3,
            palo:0,
            effectiveness:10,
            id:33,
            show:false
        },
        {
            number:4,
            palo:0,
            effectiveness:1,
            id:34,
            show:false
        },
        {
            number:5,
            palo:0,
            effectiveness:2,
            id:35,
            show:false
        },
        {
            number:6,
            palo:0,
            effectiveness:3,
            id:36,
            show:false
        },
        {
            number:7,
            palo:0,
            effectiveness:4,
            id:37,
            show:false
        },
        {
            number:10,
            palo:0,
            effectiveness:5,
            id:38,
            show:false
        },
        {
            number:11,
            palo:0,
            effectiveness:6,
            id:39,
            show:false

        },
        {
            number:12,
            palo:0,
            effectiveness:7,
            id:40,
            show:false
        },
    ]

    def repartir_cartas
        p "reparto cartas"
        p "players.length => #{players.length}"
        if players.length === 2
            
            players.each do |player|
                p "El player es => #{player}"
                p "Esta es la mano del player => #{player.playerHands.last}"
            end
        else
        
        end



    end

    def mostrar
        p "Estoy mostrando una carta"
    end


    def join player
        if self.players.length <= 2

            player.team = 2
            self.curret_player = player.id
            self.current_hand = player.id
            self.status_game = 1
            self.players.push(player)

            hand = player.playerHands.last
            hand.round_hand = 1

            if hand.save
                return true
            else   
                return false
            end
        end
        return false
    end
end
