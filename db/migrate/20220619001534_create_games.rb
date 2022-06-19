class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :status_game # Estado del juego {0:'creado', 1:'jugando', 2:'finalizado'}
      t.integer :winner #id del equipo ganador (Ellos/Nosotros)
      t.integer :curret_player
      t.integer :current_hand
      t.timestamps
    end
  end
end
