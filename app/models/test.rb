class Test < ApplicationRecord
  def self.c_sort(c_title)
    # category = Category.find_by title: c_title
    # where(category_id: category.id).order(id: :desc).pluck(:title)
    joins("JOIN categories ON categories.id = tests.category_id").where(category_id: Category.find_by(title: c_title).id)
      .order(id: :desc)
      .pluck(:title)
  end
end
