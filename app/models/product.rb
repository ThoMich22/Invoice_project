class Product < ApplicationRecord
  has_many :selections
  has_many :invoices, through: :selections

  validates :title,
    presence: true, 
    length: { in: 5..140}

  validates :description,
    presence: true, 
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: {greater_than: 0.00}

end
