class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :card
      t.belongs_to :round
      t.text :user_input, null: false
      t.integer :is_correct, default: 0

      t.timestamps
    end

  end
end
