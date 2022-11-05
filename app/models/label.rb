class Label < ApplicationRecord

  #relaciones
  has_and_belongs_to_many :publications
  
  #validaciones
  validates :contact, presence: true
  def to_s
    contact
  end
end
