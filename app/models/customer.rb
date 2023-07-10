class Customer < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*\d).+\z/ }

  # include active true, false
  validates :active, inclusion: { in: [true, false],
                                  message: "Only true or false are allowed" }
end
