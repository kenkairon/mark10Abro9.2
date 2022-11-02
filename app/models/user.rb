class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relationships
  # usuario tiene muchas publicaiones
  has_many :publications, dependent: :destroy
  
  # relacion tabla intermedia boards
  has_many :boards, dependent: :destroy #eliminación en cascada, se elimina la reserva tambien
  has_many :publications, through: :boards

  #accepts_nested_attributes_for :publications

   enum rol: [:visitante, :publicador, :admin]
    after_initialize do
      if self.new_record?
        self.rol ||= :visitante
      end
    end
end
