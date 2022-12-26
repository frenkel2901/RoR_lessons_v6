module User::Auth

  extend ActiveSupport::Concern

  MAIL = /\A[\w]+@([A-z0-9]+[.])+[A-z]{2,4}\z/

  included do
    validates :mail, format: { with: MAIL, message: "example@mail.com" }
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

end
