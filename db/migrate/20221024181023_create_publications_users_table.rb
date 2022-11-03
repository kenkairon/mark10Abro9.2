class CreatePublicationsUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :publications_users_tables do |t|
      create_join_table :publications, :users
      t.timestamps
    end
  end
end
