class CreateLabelsPublicationsTable < ActiveRecord::Migration[7.0]
  def change   
      create_join_table :labels, :publications     
    end
  end
end
