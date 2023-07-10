class Artist < ApplicationRecord
  validates :name, presence: true
  validate :born_in_the_future
  validate :before_birth_date

  # nacido en un futuro
  def born_in_the_future
    return nil if birth_date.nil?
    return errors.add(:birth_date, "can't be in the future") if birth_date > Time.zone.today
  end

  # antes de la fecha de nacimiento
  def before_birth_date
    return nil if death_date.nil?
    return errors.add(:death_date, "you do not have a birth_date") if birth_date.nil?
    return unless death_date < birth_date

    errors.add(:death_date,
               "death_date can't be after the birth_date")
  end
end
