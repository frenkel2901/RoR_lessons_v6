class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  scope :c_default, -> { orded(:title) }

  validates :title, persence: true
end
