class Invoice < ApplicationRecord
  belongs_to :client
  has_many :selections, inverse_of: :invoice
  has_many :products, through: :selections
  accepts_nested_attributes_for :selections 

  def total_invoice
    @total_invoice = 0

    self.selections.each do |selection|
      @total_invoice = selection.product.price + @total_invoice
    end
  
    return @total_invoice
  
  end

end
