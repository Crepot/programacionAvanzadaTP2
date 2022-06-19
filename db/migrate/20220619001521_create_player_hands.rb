class CreatePlayerHands < ActiveRecord::Migration[7.0]
  def change
    create_table :player_hands do |t|
      t.belongs_to :player
      t.belongs_to :game
      #Una mano tiene 3 cartas --> estas cartas me las guardo como instancias para manejar el atributos show
      t.integer :round_hand #Es el número de ronda -->tengo 3 rondas por "mano"

      t.integer :truco #enum con los valores del truco/retruco y vale4 (tambien si no se quizo)
      t.integer :envido #enum con los valores del envido/real_envido/falta_envido (tambien si no se quizo)

      t.integer :score_hand 

      t.timestamps
    end
  end
end
