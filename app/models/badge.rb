class Badge < ApplicationRecord
  RULES = %i[category? level? attempt?].freeze

  has_many :given_badges
  has_many :users, through: :given_badges, dependent: :destroy

  validates :title, :rule_value, :rule_name, presence: true

  scope :by_rule_name, ->(name) { where(rule_name: name) }
  scope :by_rule_value, ->(name) { where(rule_value: name) }
end
