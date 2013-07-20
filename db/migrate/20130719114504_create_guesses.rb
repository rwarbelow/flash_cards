class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      # t.belongs_to :card
      # t.belongs_to :round
      t.integer :card_id
      t.integer :round_id
      t.text :user_input, null: false
      t.integer :is_correct, default: 0

      t.timestamps
    end

  end
end
