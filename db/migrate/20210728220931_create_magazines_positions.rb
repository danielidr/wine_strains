class CreateMagazinesPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines_positions do |t|
      t.references :magazine, foreign_key: true
      t.references :position, foreign_key: true
      t.references :oenologist, foreign_key: true

      t.timestamps
    end
  end
end
