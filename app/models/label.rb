class Label < ApplicationRecord
  belongs_to :publication
  validates :contact, presence: true
  def to_s
    contact
  end
end
