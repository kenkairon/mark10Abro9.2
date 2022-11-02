class AddLabelIdToPublications < ActiveRecord::Migration[7.0]
  def change
    add_column :publications, :label_id, :integer
  end
end
