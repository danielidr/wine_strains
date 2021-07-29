class CreateMagazinesPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines_positions do |t|
      t.references :magazine, foreign_key: true
      t.references :oenologist, foreign_key: true
      t.boolean :editor, default: false
      t.boolean :writer, default: false
      t.boolean :reviewer, default: false

      t.timestamps
    end
  end
end
