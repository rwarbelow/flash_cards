class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end

  end
end
