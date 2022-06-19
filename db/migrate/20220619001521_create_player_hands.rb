class CreatePlayerHands < ActiveRecord::Migration[7.0]
  def change
    create_table :player_hands do |t|
      t.belongs_to :player
      t.belongs_to :game
      t.integer :card1 
      t.integer :card2 
      t.integer :card3 
      t.integer :score_hand 

      t.timestamps
    end
  end
end
