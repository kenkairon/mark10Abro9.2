class RemoveRemoverFromBoards < ActiveRecord::Migration[7.0]
  def change
    remove_column :boards, :fecha, :date
  end
end
