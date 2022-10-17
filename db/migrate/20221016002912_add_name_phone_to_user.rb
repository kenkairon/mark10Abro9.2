class AddNamePhoneToUser < ActiveRecord::Migration[7.0]  
    def change
      add_column :users,:nombre, :string
      add_column :users,:telefono, :string
    end
end
