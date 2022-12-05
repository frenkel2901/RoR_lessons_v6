class Category < ApplicationRecord
  default_scope { orded(:title) }
  
  has_many :tests, dependent: :destroy

  validates :title, presence: true

end
