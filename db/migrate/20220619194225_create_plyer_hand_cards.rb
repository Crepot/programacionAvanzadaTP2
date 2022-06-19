class CreatePlyerHandCards < ActiveRecord::Migration[7.0]
  def change
    create_table :plyer_hand_cards do |t|

      t.timestamps
    end
  end
end
