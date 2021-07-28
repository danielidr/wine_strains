class CreateJoinTableOenologistPosition < ActiveRecord::Migration[5.2]
  def change
    create_join_table :oenologists, :positions do |t|
      t.index [:oenologist_id, :position_id]
      t.index [:position_id, :oenologist_id]
    end
  end
end
