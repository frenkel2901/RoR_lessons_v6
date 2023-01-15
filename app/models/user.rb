require 'digest/sha1'

class User < ApplicationRecord

  MAIL = /\A[\w]+@([A-z0-9]+[.])+[A-z]{2,4}\z/

  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :mail, uniqueness: true, format: { with: MAIL, message: "example@mail.com" }
  validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
  def my_tests(level)
    tests.where(level: level)
  end

end
