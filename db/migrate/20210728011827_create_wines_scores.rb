class CreateWinesScores < ActiveRecord::Migration[5.2]
  def change
    create_table :wines_scores do |t|
      t.references :wine, foreign_key: true
      t.references :oenologist, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
