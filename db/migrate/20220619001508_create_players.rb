class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name # PlayerName
      t.string :tokenAuth # Token de auth
      t.boolean :sessionActive # Para validar si tiene una session activa o no
      t.integer :team # team otorgado al jugador "Ellos/Nosotros"
      t.string :email # Email del
      t.integer :score

      t.timestamps
    end
  end
end
