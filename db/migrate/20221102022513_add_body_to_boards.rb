class AddBodyToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :body, :text
  end
end
