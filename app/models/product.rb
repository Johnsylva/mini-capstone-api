class Product < ApplicationRecord
  belongs_to :supplier
  validates :name, presence: true
  #validates :price, numericality: {greater_than: 0}
  #validates :inventory, presence: true
  #validate :is_price_and_description

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def is_discounted
    if price && price <= 10
      true
    else
      false
    end
  end

  def tax
    tax = price * 0.09
    return tax.round(2)
  end

  def total
    puts tax
    total = price + tax
    return total
  end

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end

  private

  # def is_price_and_description
  #   if price.blank? && description.blank?
  #     errors.add(:base, "price and description should be present")
  #   #errors.add(:is_discounted, "discount should be present")
  #   #errors.add(:total, "total should be present")
  #   end
  # end


  def is_price_and_description
    if price.blank?
      errors.add(:price, "must be present")
    end

    if description.blank?
      errors.add(:description, "must be present")
    end
  end

end
