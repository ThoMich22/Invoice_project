class Invoice < ApplicationRecord
  belongs_to :client
  has_many :selections, inverse_of: :invoice
  has_many :products, through: :selections
  belongs_to :user, optional: true
  
  accepts_nested_attributes_for :selections, allow_destroy: true

 
  # before_save :find_or_create_products

  # def find_or_create_products
  #   self.selections.each do |selection|
  #      selection.product = Product.find_or_create_by(title:selection.product.title)
       
  #   end
  # end

  def total_invoice
    @total_invoice = 0.00

    self.selections.each do |selection|
     @total_invoice = selection.product.price + @total_invoice
    end
  
    return @total_invoice
  
  end
end
