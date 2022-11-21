class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :author, class_name: "User"

  def self.c_sort(c_title)
    joins("JOIN categories ON categories.id = tests.category_id").where(categories: { title: c_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
