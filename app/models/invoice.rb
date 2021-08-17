class Invoice < ApplicationRecord
  belongs_to :client
  has_many :selections
  has_many :products, through: :selections

  

  def total_invoice
    @total_invoice = 0

    self.selections.each do |selection|
        @total_invoice = selection.product.price + @total_invoice
    end
  
    return @total_invoice
  
  end

end
