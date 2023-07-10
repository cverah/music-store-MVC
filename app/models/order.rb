class Order < ApplicationRecord
  belongs_to :customer

  validates :total, numericality: { greater_than: 0, message: ":total is greater than 0" }
  validate :date_future

  def date_future
    return nil if date.nil?
    return errors.add(:date, "can't be in the future") if date > Time.zone.today
  end
end
