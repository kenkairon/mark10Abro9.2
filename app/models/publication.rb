class Publication < ApplicationRecord
  belongs_to :user
  has_many :labels, dependent: :destroy
  has_one_attached :photo
  paginates_per 4
  validates :title, presence: true
  validates :description, presence: true
  validates :route, presence: true
  validates :price, presence: true
  #validates :photo, attached: true, limit: { min: 1, max: 3 }, content_type: [:png, :jpg, :jpeg, :mp3,:gif]

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
