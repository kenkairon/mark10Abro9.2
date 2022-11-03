class RemovePublicationsRefLabels < ActiveRecord::Migration[7.0]
  def change
    remove_reference :labels, :publication, index: true, foreign_key: true
  end
end
