class Product < ApplicationRecord
  has_many :selections
  has_many :invoices, through: :selections

end
