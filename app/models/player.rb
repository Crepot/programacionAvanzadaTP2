class Player < ApplicationRecord
    has_many :player_hands, dependent: :
    has_many :games, through: :player_hands

    #Validations
    validates :name,:email, presence:true

    before_create :default_values 
    enum team: {ellos:1 ,nosotros:1}
    def default_values
        self.team = -1
        self.sessionActive = false
        self.score = 0
    end

    has_secure_password
end
