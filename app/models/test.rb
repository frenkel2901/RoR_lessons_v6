class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, ->(category) { joins(:category).where(categories: { id: category }) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_ids, ->(ids) { where(id: ids) }

  def self.filter_by_category(category)
    by_category(category).pluck(:title)
  end

  def self.filter_by_level(level)
    by_level(level).pluck(:title)
  end

end
