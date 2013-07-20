class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :question, null: false
      t.text :answer, null: false
      # t.belongs_to :deck
      t.integer :deck_id

      t.timestamps
    end

  end
end
