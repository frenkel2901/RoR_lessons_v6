class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :title, persence: true

  default_scope { orded(:title) }
end
