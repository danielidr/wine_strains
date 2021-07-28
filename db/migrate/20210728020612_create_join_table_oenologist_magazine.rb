class CreateJoinTableOenologistMagazine < ActiveRecord::Migration[5.2]
  def change
    create_join_table :oenologists, :magazines do |t|
      t.index [:oenologist_id, :magazine_id]
      t.index [:magazine_id, :oenologist_id]
    end
  end
end
