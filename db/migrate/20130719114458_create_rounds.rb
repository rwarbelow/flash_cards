class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      # t.belongs_to :user
      # t.belongs_to :deck
      t.integer :user_id
      t.integer :deck_id

      t.timestamps
    end

  end
end
