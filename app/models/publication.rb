class Publication < ApplicationRecord
  #Relaciones
  belongs_to :user
  #relacion con labels
  has_and_belongs_to_many :labels
  #relacion con tabla intermedia
  has_many :boards, dependent: :destroy #eliminación en cascada, se elimina la reserva tambien
  has_many :users, through: :boards

  accepts_nested_attributes_for :users

  #relacion photo
  has_one_attached :photo

  #paginación
  paginates_per 4

  #validacion
  validates :title, presence: true
  validates :description, presence: true
  validates :route, presence: true
  validates :price, presence: true
  validates :photo, attached: true, content_type: ['image/png', 'image/jpeg']

  accepts_nested_attributes_for :labels ,
  reject_if: proc { |attr| attr['contact'].blank? },
  allow_destroy: true

  def to_s
      title
      description
      route
      price
  end
end
