class Test < ApplicationRecord
  def self.c_sort(c_title)
    joins("JOIN categories ON categories.id = tests.category_id").where(categories: { title: c_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
