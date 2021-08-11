class Invoice < ApplicationRecord
  belongs_to :client
  has_many :selections
  has_many :products, through: :selections
end
