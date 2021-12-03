class Selection < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  # validates_presence_of :invoice 
  # validates_presence_of :product 

  accepts_nested_attributes_for :product 
end
