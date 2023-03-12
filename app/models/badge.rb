class Badge < ApplicationRecord

  RULES = [
    { value: "attempt?", title: "За успешное прохождения теста с первого раза" },
    { value: "category?", title: "За прохождение всех тестов из категории" },
    { value: "level?", title: "За прохождение всех тестов по уровню" },
  ]

  has_many :given_badges
  has_many :users, through: :given_badges, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true, format: { with: URI::regexp(%w(http https)) }
  validates :rule, presence: true
end
