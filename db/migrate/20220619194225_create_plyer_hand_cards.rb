class CreatePlyerHandCards < ActiveRecord::Migration[7.0]
  def change
    create_table :plyer_hand_cards do |t|
      t.belongs_to :player_hand

      t.integer :number
      t.integer :palo
      t.integer :effectiveness
      t.boolean :show
      
      t.timestamps
    end
  end
end
