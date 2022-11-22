class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  def self.c_sort(c_title)
    joins(:category)
      .where(categories: { title: c_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
