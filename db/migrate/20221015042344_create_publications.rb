class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :description
      t.string :route
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
