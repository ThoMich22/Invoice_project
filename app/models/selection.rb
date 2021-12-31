class Selection < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  accepts_nested_attributes_for :product 
end
