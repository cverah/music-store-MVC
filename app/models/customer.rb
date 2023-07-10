class Customer < ApplicationRecord
  validates :username , presence: true , uniqueness: true
  validates :email , uniqueness:true , format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password , presence: true , length: { minimum: 6 } , format: { with: /\A(?=.*\d).+\z/ }
end
