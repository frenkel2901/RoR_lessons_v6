class Test < ApplicationRecord
  def self.c_sort(c_title)
    category = Category.find_by title: c_title
    self.where(category_id: category.id).pluck(:title)
  end
end
