class Store < ActiveRecord::Base

  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, more_than: 0}
  validate :apparel_type

  def apparel_type
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "must be true for one")
      errors.add(:womens_apparel, "must be true for one")
    end
  end
end
