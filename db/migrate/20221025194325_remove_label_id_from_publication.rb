class RemoveLabelIdFromPublication < ActiveRecord::Migration[7.0]
  def change
    remove_column :publications, :label_id, :bigint
  end
end
